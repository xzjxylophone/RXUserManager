



Pod::Spec.new do |s|
  s.name     = "RXUserManager"
  s.version  = "0.5"
  s.license  = "MIT"
  s.summary  = "RXUserManager is a user manager"
  s.homepage = "https://github.com/xzjxylophone/RXUserManager"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXUserManager.git', :tag => "v#{s.version}" }
  s.description = %{
       RXUserManager is a user manager.
  }
  s.source_files = 'RXUserManager/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '5.0'

end



