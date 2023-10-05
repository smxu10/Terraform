    #### install Jenkins
    resource "aws_ssm_association" "install_jenkins" {
    name = "install_jenkins"

    targets {
        key    = "tag:server_tag"
        values = [var.server_tag] 
    }

    output_location {
        s3_bucket_name = "ssm-output-sean"
        s3_region = "us-east-1"
    }
    }
