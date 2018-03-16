Pod::Spec.new do |s|
  s.name         = "LRQCountButton"
  s.version      = "0.0.2"
  s.summary      = "A category for button with time count down ."
  s.license      = "MIT"
  s.author             = { "lirenqiang" => "958246321@qq.com" }
  s.source       = { 
    :git => "https://github.com/silenceleewq/LRQCountButton.git", 
    :tag => "#{s.version}" }
  s.requires_arc = true
  s.source_files  = "LRQCountButton/**/*.{h,m}"
  s.framework  = "UIKit"
  s.homepage="https://github.com/silenceleewq/LRQCountButton"
  s.platform = :ios, "9.0"
end
