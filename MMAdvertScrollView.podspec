Pod::Spec.new do |s|
  s.name         = 'MMAdvertScrollView'
  s.version      = '1.0.1'
  s.summary      = 'The fastest and most convenient conversion between JSON and model'
  s.homepage     = 'https://github.com/CoderHuiYu/MMAdvertScrollView'
  s.license      = 'MIT'
  s.author       = { 'Jeffery Yu' => '171364980@qq.com' }
  s.platform     = :ios, '10.0'
  s.source       = { :git => 'https://github.com/CoderHuiYu/MMAdvertScrollView.git', :tag => s.version }
  s.source_files  = 'MMAdvertScrollView/**/*.swift'
  s.swift_versions = '5.0'
end