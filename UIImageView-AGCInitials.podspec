Pod::Spec.new do |s|
  s.name             = "UIImageView-AGCInitials"
  s.version          = "0.1.0"
  s.summary          = "An UIImageView category to set initials of a contact's name as the image"
  s.description      = "An UIImageView category that allows to set an image containing the initials of a contact's name on a colored background. The color of the background is the same for identical names."
  s.homepage         = "https://github.com/AndreaCipriani/UIImageView-AGCInitials"
  s.screenshots     = "http://i.imgur.com/ZHagHyK.png", "http://i.imgur.com/a5bBMub.png"
  s.license          = 'MIT'
  s.author           = { "Andrea Cipriani" => "andrea.g.cipriani@gmail.com" }
  s.source           = { :git => "https://github.com/AndreaCipriani/UIImageView-AGCInitials.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AndreaCipriani'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'UIImageView-AGCInitials' => ['Pod/Assets/*.png']
  }
end
