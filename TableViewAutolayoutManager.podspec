#
# Be sure to run `pod lib lint TableViewAutolayoutManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TableViewAutolayoutManager"
  s.version          = "0.2"
  s.summary          = "Dynamic custom UITableViewCell height based on autolayout."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       Automatically takes care of custom UITableViewCell dynamic height. Written in Swift.
                       DESC

  s.homepage         = "https://github.com/arturjaworski/TableViewAutolayoutManager"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Artur Jaworski" => "kontakt@arturjaworski.pl" }
  s.source           = { :git => "https://github.com/arturjaworski/TableViewAutolayoutManager.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TableViewAutolayoutManager' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'TableViewManager'
end
