resource "aws_iam_user" "my_iam_user" {
  name = "anurag"
}

resource "aws_iam_access_key" "iamkey" {
  user = aws_iam_user.my_iam_user.name
  
}

resource "aws_s3_bucket" "localname" {

  bucket = "classroom-practice-bucket"
  
}
 

 resource "aws_iam_user_policy" "localpolicy" {
  name = "my-policy"
   user = aws_iam_user.my_iam_user.name

   policy = jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"s3:ListAllMyBuckets",
				"s3:ListBucket"
			],
			"Resource": "*"
		}
	]
}

   )
 }

 resource "aws_iam_user_policy" "ec2-permission" {
	name = "my-second-policy"
	user = aws_iam_user.my_iam_user.name
	policy = jsondecode(
		
	)
 }


 