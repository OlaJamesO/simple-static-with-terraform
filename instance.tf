resource "aws_key_pair" "dove-key" {
  key_name   = var.PRIV_KEY
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "dove-web" {
  ami                    = var.AMIs[var.REGION]
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.dove-pub-1.id
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove_stack_sg.id]
  tags = {
    Name  = "my-dove"
    Owner = "Dev"
  }


  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

      inline = [
        "sudo yum install dos2unix -y",
        "sudo dos2unix /tmp/web.sh",
        "sudo chmod u+x /tmp/web.sh",
        "sudo /tmp/web.sh"
      ]
    }

    connection {
      user        = var.USER
      private_key = file("dovekey")
      host        = self.public_ip
    }
}

resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.ZONE1
  size              = 4
  tags = {
    Name = "extr-vol-4-dove"
  }
}

resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.dove-web.id
}


output "PublicIP" {
  value = aws_instance.dove-web.public_ip
}
