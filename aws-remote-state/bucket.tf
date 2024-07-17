resource "aws_s3_bucket" "bucket_remote_state" {
  bucket = "brunoalmeida-remote-state-practice"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket_remote_state.id
  versioning_configuration {
    status = "Enabled"
  }
}