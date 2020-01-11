resource "aws_vpc" "azizasalieva-de" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                       = "azizasalieva.de"
    Name                                    = "azizasalieva.de"
    "kubernetes.io/cluster/azizasalieva.de" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "azizasalieva-de" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                       = "azizasalieva.de"
    Name                                    = "azizasalieva.de"
    "kubernetes.io/cluster/azizasalieva.de" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "azizasalieva-de" {
  vpc_id          = "${aws_vpc.azizasalieva-de.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.azizasalieva-de.id}"
}