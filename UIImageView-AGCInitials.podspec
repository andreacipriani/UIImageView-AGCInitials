Pod::Spec.new do |s|
  s.name             = "UIImageView-AGCInitials"
  s.version          = "0.0.2"
  s.summary          = "An UIImageView category to set the initials of a contact's name as the image placeholder"
  s.description      = "An UIImageView category that allows to set an image containing the initials of a contact's name with a colored background. The color of the background is automatically generated and it is the same for identical names, so you can use it with cell recycle in table/collection view!"
  s.homepage         = "https://github.com/AndreaCipriani/UIImageView-AGCInitials"
  s.screenshots     = "https://raw.githubusercontent.com/andreacipriani/UIImageView-AGCInitials/master/Screenshots/agc_screen1.png", "https://raw.githubusercontent.com/andreacipriani/UIImageView-AGCInitials/master/Screenshots/agc_screen2.png"
  s.license          = 'MIT'
  s.author           = { "Andrea Cipriani" => "andrea.g.cipriani@gmail.com" }
  s.source           = { :git => "https://github.com/AndreaCipriani/UIImageView-AGCInitials.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AndreaCipriani'
  s.ios.deployment_target     = '8.0'
  s.tvos.deployment_target    = '9.0'
   s.xcconfig  =  { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/UIImageView-AGCInitials/Pod/Classes"',
                   'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/UIImageView-AGCInitials/Pod/Classes"' }
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
end
