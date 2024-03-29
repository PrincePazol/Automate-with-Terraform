# Create VPC
resource "aws_key_pair" "deployer_terra" {
  key_name = "deployer-key"
  public_key = file("./terraform-project.pub")
}