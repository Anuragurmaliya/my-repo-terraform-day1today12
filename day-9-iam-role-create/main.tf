### Create IAM policy
resource "aws_iam_policy" "anurag23_policy" {
  name        = "test_policy"
  description = "Permissions for EC2"
  policy      = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Action: "ec2:*",
            Effect: "Allow",
            Resource: "*"
        }
      ]
    })
}

### Create IAM role
resource "aws_iam_role" "anurag43_role" {
  name = "anurag_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "examplerole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
### Attach IAM policy to IAM role
resource "aws_iam_policy_attachment" "policy_attachment98" {
  name       = "my_policy_attachment"
  roles     = aws_iam_role.anurag43_role.managed_policy_arns
  policy_arn = aws_iam_policy.anurag23_policy.arn
}

### Create instance profile using role
resource "aws_iam_instance_profile" "my_ec2_profile" {
  name = "ec2-instance_profile"
  role = aws_iam_role.anurag43_role.name
}

### Create EC2 instance and attache IAM role
resource "aws_instance" "example_instance" {
  instance_type        = var.instance_type
  ami                  = var.ami_id
  iam_instance_profile = aws_iam_instance_profile.my_ec2_profile.name
}
