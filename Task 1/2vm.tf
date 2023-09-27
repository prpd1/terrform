# #create 2 VMs (vm1, vm2), and 3 storage disks (sd1, sd2, sd3) in AWS


# resource "aws_instance" "vm1" {
   
#     ami = "ami-03a6eaae9938c858c" #linux image
#     key_name = "terraform-key" 
#     instance_type = "t2.micro"   
# }

# resource "aws_instance" "vm2" {
    
#     ami = "ami-0f3769c8d8429942f" #linux image
     
#     instance_type = "t2.micro"   
# }

# variable "s3_bucket_names" {
#   type = list
#   default = ["pravsd1", "pravsd2"]
# }

# resource "aws_s3_bucket" "buckets" {
#   bucket = var.s3_bucket_names[count.index]
#   count = length(var.s3_bucket_names)
# }



