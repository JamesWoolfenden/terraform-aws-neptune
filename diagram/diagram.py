# diagram.py
# Needs diagrams from pip and graphwiz installed
from diagrams import Cluster, Diagram
#from diagrams.aws.network.ElasticLoadBalancing import ELB
from diagrams.aws.database import Neptune
from diagrams.aws.network import PrivateSubnet
from diagrams.aws.network import VPC

with Diagram("Neptune", show=False):
    vpc=VPC("vpc")
    with Cluster("Security Group"):
        with Cluster("Private Subnet A"):
            db=Neptune("Cluster")
    vpc>>db
