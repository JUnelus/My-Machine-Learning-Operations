import boto3

def setup_s3_bucket(bucket_name):
    s3 = boto3.client('s3')
    s3.create_bucket(Bucket=bucket_name)

if __name__ == "__main__":
    setup_s3_bucket('mlops-model-bucket')
