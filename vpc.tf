resource "aws_vpc" "skyage" {
  cidr_block = "172.31.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "skyage-vpc"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.31.0.0/16"
  availability_zone       = "ap-northeast-1"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.31.2.0/16"
  availability_zone       = "ap-northeast-2"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.31.3.0/16"
  availability_zone       = "ap-northeast-1"

  tags = {
    Name = "PrivateSubnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.31.4.0/16"
  availability_zone       = "ap-northeast-1"

  tags = {
    Name = "PrivateSubnet2"
  }
}


# Internet Gateway
resource "aws_internet_gateway" "skyage_igw" {
  vpc_id = aws_vpc.skyage.id
  tags = {
    "Name" = "skyage-igw"
  }
}
