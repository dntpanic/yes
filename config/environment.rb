# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
YesDontpanicComUa::Application.initialize!

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
