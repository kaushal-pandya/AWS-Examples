## create a bucket
```sh
aws s3 mb s3://bucket-policy-example-pk-kp-123
```

##

```sh
aws s3api put-bucket-policy --bucket bucket-policy-example-pk-kp-123 --policy file://policy.json
```

##clenup