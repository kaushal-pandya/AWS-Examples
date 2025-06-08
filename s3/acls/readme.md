## create a bucket
```sh
aws s3appi create-bucket --bucket acl-example-kp-pk-2244 --region us-east-1
```

## turn off Block public access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-example-kp-pk-2244 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictedPublicBuckets=true"
```

```sh 
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-kp-pk-2244 \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerEnforced}]"
```

## Change ACLs to allow for a user in another AWS Account
```sh
aws s3api put-bucket-acl \
--bucket acl-example-kp-pk-2244
--access-control-policy file:///workspace/AWS-Examples/s3/acls/policy.json
```

## cleanup
```sh
aws s3 rb s3://acl-example-kp-pk-2244
```