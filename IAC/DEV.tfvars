# Global
environment = "Development"
subnet_type = "Trusted"
cost_center = "00095"

# VM
ec2_instance_size = "medium"
os_platform = "RHEL8"
instance_name = "KING"
instance_profile= "HF-EC2-SSMRole"
user_data_path = "./install_scripts/install.sh"

# DB
cluster_name = "demo"
database_name = "lofl"
engine = "aurora-mysql"
rds_instance_size = "small"
