import boto3

AWS_REGION = "us-east-1"
ec2 = boto3.client('ec2', region_name='us-east-1')

def ec2_desc(ec2):
    response = ec2.describe_instances()['Reservations']   #InstanceIds=['i-0914fa285e941f964']
    insts=response[0]['Instances'][0]  # instance items in dictionary
    # print('PrivateIpAddress=' + insts['PrivateIpAddress'], 
    #        '\n' 'PublicIpAddress= ' + insts['PublicIpAddress'])  #.get('PrivateIpAddress')

    # add extra comments for pull request test
    # when ec2 instance in stop state, the 'PublicIpAddress' is not retrievable
    print('PrivateIpAddress=' + insts['PrivateIpAddress']) 

def lambda_handler(event, context):
    ec2_desc(ec2)