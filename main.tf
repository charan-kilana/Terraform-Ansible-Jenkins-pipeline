resource "aws_launch_template" "web_server_as" {
    name = "myproject"
    image_id           = "ami-07a6f770277670015"       # Change this ami according you region and your kernel version
    vpc_security_group_ids = [aws_security_group.web_server.id]
    instance_type = "t2.micro"
    key_name = "march"    #Keep the same key which you're using for jenkins sever
    tags = {
        Name = "DevOps"
    }
    
}
   
  resource "aws_elb" "web_server_lb"{
     name = "web-server-lb"
     security_groups = [aws_security_group.web_server.id]
     subnets = ["subnet-0965621dab8b4fffe", "subnet-009d1f3350828862a"]    # Change the subnets accoridng to yours look for subnets in VPC-SUBNES 
     listener {
      instance_port     = 8000
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
    }
    tags = {
      Name = "terraform-elb"
    }
  }
resource "aws_autoscaling_group" "web_server_asg" {
    name                 = "web-server-asg"
    min_size             = 1
    max_size             = 3
    desired_capacity     = 2
    health_check_type    = "EC2"
    load_balancers       = [aws_elb.web_server_lb.name]
    availability_zones    = ["us-east-1c", "us-east-1e"]     # Change the availability zones accoding to your VPC-Subnets
    launch_template {
        id      = aws_launch_template.web_server_as.id
        version = "$Latest"
      }
    
    
  }

