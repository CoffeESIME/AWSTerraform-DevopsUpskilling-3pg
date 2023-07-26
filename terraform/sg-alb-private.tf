# Create an AWS Security Group resource for the Private ALB
resource "aws_security_group" "alb-private" {
  name_prefix = "${local.prefix}-sg-alb-private"       # Name prefix for the security group
  description = "Private ALB SG Group"                # Description for the security group
  vpc_id      = aws_vpc.this.id                        # ID of the VPC in which the security group will be created

  ingress {
    from_port   = 80                      # Ingress rule: Allow incoming traffic on port 8081
    to_port     = 80                      # Ingress rule: Allow incoming traffic on port 8081
    protocol    = "tcp"                     # Ingress rule: Allow TCP traffic
    cidr_blocks = ["0.0.0.0/0"]              # Ingress rule: Allow incoming traffic from any IP (0.0.0.0/0)
  }

  egress {
    from_port   = 0                         # Egress rule: Allow all outgoing traffic
    to_port     = 0                         # Egress rule: Allow all outgoing traffic
    protocol    = "-1"                      # Egress rule: Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]              # Egress rule: Allow outgoing traffic to any IP (0.0.0.0/0)
  }

  depends_on = [
    aws_vpc.this                            # Ensure VPC is created before the security group
  ]
}
