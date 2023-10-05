    #### install Jenkins
    resource "aws_ssm_association" "test-doc" {
    name = "test-doc"

    targets {
        key    = "tag:server_tag"
        values = [var.server_tag] 
    }

    output_location {
        s3_bucket_name = "ssm-output-sean"
        s3_region = "us-east-1"
    }
    }
