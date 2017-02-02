platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

target 'StarWars' do
  pod 'Alamofire', '~> 4.0'
  pod 'ObjectMapper', '~> 2.2'
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'RxSwift', '~> 3.0.0-beta.1'
  pod 'RxCocoa', '~> 3.0.0-beta.1'
  pod 'SnapKit', '~> 3.0.0'
end

target 'StarWarsTests' do
  pod 'Quick'
  pod 'Nimble'
  pod 'OHHTTPStubs'
  pod 'OHHTTPStubs/Swift'
  
  # Duplicated for successful linking
  pod 'RxCocoa', '~> 3.0.0-beta.1'
end
