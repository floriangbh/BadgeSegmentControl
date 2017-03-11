Pod::Spec.new do |s|
s.name             = 'BadgeSegmentControl'
s.version          = '1.0.4'
s.summary          = 'Sweet SegmentControl with image and badge.'
s.homepage         = 'https://github.com/terflogag/BadgeSegmentControl'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Florian Gabach' => 'contact@floriangabach.fr' }
s.source           = { :git => 'https://github.com/terflogag/BadgeSegmentControl.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'
s.source_files = 'BadgeSegmentControl/Classes/**/*'
s.dependency 'BadgeSwift', '~> 4.0'
end
