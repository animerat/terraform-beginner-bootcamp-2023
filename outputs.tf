output "bucket_name" {
    description = "Bucket name for out static website hosting"
    value = module.home_helloworld_hosting.bucket_name
}

output "s3_website_endpoint" {
    description = "S3 Static Website hosting endpoint"
    value = module.home_helloworld_hosting.website_ednpoint
}

output "cloudfront_url" {
    description = "The Cloudfront Distribution Domain Name"
    value = module.home_helloworld_hosting.domain_name
}