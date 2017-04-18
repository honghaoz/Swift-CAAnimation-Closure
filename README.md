# Swift-CAAnimation-Closure

Swift extension which adds start, animating and completion closures for CAAnimation objects.

Aka, CAAnimation + Closure or CAAnimation + Block.

# Preview

### Start and Completion
![demo-start-completion](https://raw.githubusercontent.com/honghaoz/Swift-CAAnimation-Closure/master/Demo/demo-start-stop.gif)

### Animating (Progress)
![demo-animating](https://raw.githubusercontent.com/honghaoz/Swift-CAAnimation-Closure/master/Demo/demo-animating.gif)

# Installation
#### CocoaPods

```ruby
use_frameworks!

pod 'Swift-CAAnimation-Closure', '~> 1.0'
```

#### Manually

Just add `CAAnimation+Closure.swift` file into your project.

# API

### CAAnimation API
```swift
let animation = CABasicAnimation(keyPath: "strokeEnd")
animation.duration = 2.0
animation.fromValue = 0.0
animation.toValue = 1.0

animation.start = {
    print("Woo, the animation starts!")
    // ...
}

animation.animating = { progress in
    print("progress: \(progress)")
    // ...
}

animation.completion = { finished in
    print("Awesome, the animation just finished! :)")
    // ...
}

layer.addAnimation(animation, forKey: "animationKey")
```
### CALayer API

```
layer.addAnimation(strokeEndAnimation, forKey: "strokeEndAnimation") { finished in
	print("Animation is finished")
}
```

# The MIT License (MIT)

The MIT License (MIT)

Copyright (c) 2015 Honghao Zhang 张宏昊

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/honghaoz/swift-caanimation-closure/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

