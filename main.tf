module "all" {
  source = "github.com/DavoA/TF-Module"

  // Permissions for creating resources
  Allow_VPC        = false
  Allow_EC2        = false
  Allow_S3         = false
  Allow_ASG        = false
  Allow_LB         = false
  Allow_Lambda     = false
  Allow_Cloudfront = false

  // Connecting resources with each other
  Allow_Using_VPC_In_EC2       = false
  Allow_Using_VPC_In_ASG       = false
  Allow_Using_VPC_In_LB        = false
  Allow_Using_VPC_In_Lambda    = false
  Allow_Using_S3_In_Cloudfront = false


  // ASG
  ASG_name                  = ""
  ASG_capacity              = 1
  ASG_min_size              = 1
  ASG_max_size              = 2
  ASG_instance_profile_name = ""
  ASG_role_name             = ""
  ASG_lc_name               = ""

  // CloudFront
  Cloudfront_comment                = ""
  Cloudfront_min_ttl                = 0
  Cloudfront_default_ttl            = 3600
  Cloudfront_max_ttl                = 86400
  Cloudfront_role_name              = ""
  Cloudfront_policy_name            = ""
  Cloudfront_policy_attachment_name = ""

  // EC2
  public_ec2_instances  = 1
  private_ec2_instances = 1
  ec2_file_path         = "/path/to/your/file" # necessary if Allow_EC2 is true

  // LB
  LB_name              = ""
  LB_target_group_name = ""
  Allow_EC2_Attachment = false
  EC2_instance_id      = "" # necessary if Allow_EC2_Attachment is true

  // Lambda
  Lambda_func_name = ""
  Lambda_role_name = ""
  # necessary if Allow_Lambda is true
  Lambda_filename  = "path/to/your/file"
  Lambda_handler   = ""
  Lambda_runtime   = ""

  // S3
  S3_bucket_name       = ""
  S3_role_name         = ""
  S3_policy_name       = ""
  Allow_S3_Website     = false
  S3_html_file         = "path/to/your/html/file" # necessary if Allow_S3_Website is true
  Allow_S3_Object      = false
  # necessary if Allow_S3_Object is true
  S3_bucket_object_key = ""
  S3_file_path         = "path/to/your/file"

  // Default Resources
  # necessary if Allow_Using_VPC_In_* are false or Allow_VPC is false
  Default_VPC            = "" 
  Default_Subnets        = []
  Default_SG             = []
  # necessary if Allow_Using_S3_In_Cloudfront is false
  Another_S3             = ""
  Another_S3_Domain_name = ""
}
