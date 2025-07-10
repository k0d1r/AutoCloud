terraform {
  source = "../modules/ec2"
}

inputs = {
  subnet_id = dependency.vpc.outputs.subnet_id
  vpc_id    = dependency.vpc.outputs.vpc_id
}

dependency "vpc" {
  config_path = "./vpc.hcl"
}
