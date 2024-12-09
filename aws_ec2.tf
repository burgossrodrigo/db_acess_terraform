resource "aws_instance" "copilot" {
    ami           = "ami-0453ec754f44f9a4a"
    instance_type = "t4.micro"

    tags = {
        Name = "porteiro"
    }

    vpc_security_group_ids = [
        aws_security_group.porteiro_db.id,
        aws_security_group.porteiro.id
    ]

    root_block_device {
        volume_size = 10
    }

    key_name  = var.key_name
    user_data = file("user_data.sh")
}