# Step 1: Initiate the multipart upload, which returns an Upload ID
aws s3api create-multipart-upload \
--bucket my-bucket \
--key 'myfile'

# Step 2: Upload each part using the Upload ID
# Parts must be numbered from 1 to 1000
# Save the ETag of each uploaded part for later
aws s3api upload-part \
--bucket my-bucket \
--key 'myfile' \
--part-number 1 \
--body part01 \
--upload-id "dfRtDYU0WWCCcH43C..."

# Step 3: Complete the multipart upload
# Provide a JSON file with all part numbers and their corresponding ETags
aws s3api complete-multipart-upload \
--bucket my-bucket \
--key 'myfile' \
--multipart-upload file://parts.json \
--upload-id "dfRtDYU0WWCCcH43C..."
