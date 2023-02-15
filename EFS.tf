/*
    EFS security groups
*/

resource "aws_security_group" "efs" {
   name = "accuknox-saas"
   vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "efs-tcp-rule" {
  cidr_blocks       = [var.cidr]
  type              = "ingress"
  to_port           = 2049
  from_port         = 2049
  protocol          = "tcp"
  security_group_id = aws_security_group.efs.id
}
resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.efs.id
  cidr_blocks       = ["0.0.0.0/0"]
}


/*
   Divy EFS 1
*/

module "divy1"{
   source = "./efs"
   name= "divy1"
   cidr = var.cidr
   sec-grp-id = aws_security_group.efs.id
   private_subnets = var.private_subnets
}

/*
   Divy EFS 1
*/

module "divy2"{
   source = "./efs"
   name= "divy2"
   cidr = var.cidr
   sec-grp-id = aws_security_group.efs.id
   private_subnets = var.private_subnets
}

/*
   SoarCast EFS
*/

module "soarcast"{
   source = "./efs"
   name= "soarcast"
   cidr = var.cidr
   sec-grp-id = aws_security_group.efs.id
   private_subnets = var.private_subnets
}

/*
   saltmaster EFS
*/

module "saltmaster"{
   source = "./efs"
   name= "saltmaster"
   cidr = var.cidr
   sec-grp-id = aws_security_group.efs.id
   private_subnets = var.private_subnets
}