/*
    EFS for divy1
*/

resource "aws_efs_file_system" "divy" {
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = var.name
 } 
}

# Creating Mount target for divy
resource "aws_efs_mount_target" "divy" {
file_system_id = "${aws_efs_file_system.divy.id}"
count = length(var.private_subnets)
subnet_id = "${element(var.private_subnets, count.index)}"
security_groups = [var.sec-grp-id]
}