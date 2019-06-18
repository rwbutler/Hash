Pod::Spec.new do |s|
s.name             = 'Hash'
s.version          = '1.0.0'
s.swift_version    = '5.0'
s.summary          = 'Lightweight means of hashing Data and Strings using popular hash functions including MD5, SHA-1, SHA-256.'
s.description      = <<-DESC
Provides a convenient means of converting a message in Data or String format to a hash / message digest using a hash function (MD2, MD4, MD5, SHA-1, SHA224, SHA-256, SHA-384 or SHA-512).
                       DESC
s.homepage         = 'https://github.com/rwbutler/Hash'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Ross Butler' => 'github@rwbutler.com' }
s.source           = { :git => 'https://github.com/rwbutler/Hash.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/ross_w_butler'
s.ios.deployment_target = '8.0'
s.source_files = 'Hash/Classes/**/*'
end
