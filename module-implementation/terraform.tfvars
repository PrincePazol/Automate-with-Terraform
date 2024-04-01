cidr_block = [ 
  "10.0.0.0/16", 
  "10.0.0.0/24",
]
availability_zone = [ 
  "us-east-1a", 
  "us-east-1c" 
]
ami = [ 
  "ami-080e1f13689e07408", # Ubuntu
  "ami-0c101f26f147fa7fd", # Linux
  "ami-03cd80cfebcbb4481" # Windows
]
instance_type = [ 
  "t2.micro",
  "t2.small",
  "t2.medium"
]
count_instance = 5