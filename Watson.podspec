
Pod::Spec.new do |s|
s.name             = 'Watson'
s.version          = '0.1.2'
s.summary          = 'Device utility framework that scans for availability of all the important features & info'
s.description      = <<-DESC
Device utility framework that scans for availability of all the important features & info like Battery stats, device model, operating system etc.
DESC
s.homepage         = 'https://github.com/anilmanukonda/Watson'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Anil' => 'anilkumar.manukonda@gmail.com' }
s.source           = { :git => 'https://github.com/anilmanukonda/Watson.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'
s.source_files = 'Watson/**/*'
s.frameworks = 'UIKit', 'LocalAuthentication', 'CoreLocation'
end
