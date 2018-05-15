#!/usr/bin/env ruby

require 'aws-sdk'

endpoint = ENV['S3_ENDPOINT']

credentials = Aws::SharedCredentials.new(profile_name: 'default', path: '/usr/src/app/.aws/credentials')

client = Aws::S3::Client.new(
	region: 'us-east-1',
	endpoint: endpoint,
	credentials: credentials,
	force_path_style: true
)

s3 = Aws::S3::Resource.new(client: client)

a = 1

while true
	a += 1
	object = s3.bucket('hello-bucket').object("hello-object-#{a}")

	object.upload_file('/usr/src/app/test_file')

	puts "Object key: #{object.key}, size: #{object.size}, number: #{a}"
end
