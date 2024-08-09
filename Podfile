# FAVARD Laurent pod file
platform :ios, '17.0'

target 'railroad160' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxSwift'
  #pod 'AFQuark', :path => './../../frameworks/AFQuark/'
  
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
               end
          end
   end
end

