require 'aws-sdk-s3'      # AWS SDK for Ruby to interact with S3
require 'pry'             # Pry for debugging if needed
require 'securerandom'    # For generating UUIDs

# Read bucket name from environment variable
bucket_name = ENV['BUCKET_NAME']

# Specify AWS region (note the corrected spelling: 'ca-central-1')
region = 'ca-central-1'

# Initialize the AWS S3 client
# Ensure AWS credentials are available via ENV, IAM role, or shared config
client = Aws::S3::Client.new(region: region)

# Create a new S3 bucket
# You can skip this if the bucket already exists
resp = client.create_bucket({
  bucket: bucket_name,
  create_bucket_configuration: {
    location_constraint: region,
  },
})

# Generate a random number of files between 1 and 6
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

# Generate and upload files
number_of_files.times.each do |i|
  puts "i: #{i}"

  # Generate a unique filename
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Write a random UUID to the file
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  # Upload the file to the S3 bucket
  File.open(output_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f
    )
  end
end