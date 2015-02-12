Pod::Spec.new do |s|
  s.name             = "Swift-CAAnimation-Closure"
  s.version          = "1.3.1"
  s.summary          = "Swift extension which adds start, animating and completion closures for CAAnimation objects."
  s.homepage         = "https://github.com/honghaoz/Swift-CAAnimation-Closure"
  s.screenshots      = "https://raw.githubusercontent.com/honghaoz/Swift-CAAnimation-Closure/master/Demo/demo-start-stop.gif"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Honghao Zhang" => "zhh358@gmail.com" }
  s.source           = { :git => "https://github.com/honghaoz/Swift-CAAnimation-Closure.git", :tag => "1.3.1" }
  s.source_files     = 'CAAnimation+Closure/CAAnimation+Closure_1.1.swift'
  s.platform         = :ios, '8.0'
  s.requires_arc     = true
end
