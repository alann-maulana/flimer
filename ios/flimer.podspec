#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flimer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flimer'
  s.version          = '1.0.0'
  s.summary          = 'Flutter plugin for picking images on Mobile, Desktop and Web.'
  s.description      = <<-DESC
Flutter plugin for picking images on Mobile, Desktop and Web.
                       DESC
  s.homepage         = 'https://github.com/eyro-labs/flimer'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Eyro Labs' => 'me@eyro.co.id' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
