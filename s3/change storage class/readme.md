## create a bucket

aws s3 mb s3://class-fun-ab-kaushal449

## create a file

echo "Hello world" > hello.txt

aws s3 cp hello.txt s3://class-fun-ab-kaushal449 --storage-class STANDARD_IA

## cleanup

aws s3 rm s3://class-fun-ab-kaushal449/hello.txt
aws s3 rb s3://class-fun-ab-kaushal449



