Pod::Spec.new do |s|
  s.name             = "Swift-CAAnimation-Closure"
  s.version          = "1.4"
  s.summary          = "Swift extension which adds start, animating and completion closures for CAAnimation objects."
  s.homepage         = "https://github.com/honghaoz/Swift-CAAnimation-Closure"
  s.screenshots      = "https://raw.githubusercontent.com/honghaoz/Swift-CAAnimation-Closure/master/Demo/demo-start-stop.gif"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Honghao Zhang" => "zhh358@gmail.com" }
  s.source           = { :git => "https://github.com/honghaoz/Swift-CAAnimation-Closure.git", :tag => s.version.to_s }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.requires_arc     = true

  s.source_files     = 'Source/**/*.*'

end
