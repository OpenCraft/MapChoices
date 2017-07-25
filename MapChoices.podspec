#
# Be sure to run `pod lib lint MapChoices.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MapChoices'
  s.version          = '1.0.0'
  s.summary          = "A simple iOS library that let users choose which navigation should the app open."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "A simple iOS library that let users choose which navigation should the app open. With just one method call, you show a UIActionSheet with all the installed map Apps in the user's phone."

  s.homepage         = 'https://github.com/OpenCraft/MapChoices'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cleber' => 'cleberhenriques@ilegra.com' }
  s.source           = { :git => 'https://github.com/OpenCraft/MapChoices.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MapChoices/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MapChoices' => ['MapChoices/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
