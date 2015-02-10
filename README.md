# Swift-CAAnimation-Closure

Swift extension which adds start and completion closures for CAAnimation objects.

Aka, CAAnimation + Closure or CAAnimation + Block.

# Preview

### Start and Completion
![demo-start-completion](https://raw.githubusercontent.com/honghaoz/Swift-CAAnimation-Closure/master/CAAnimation+Closures%20Demo/demo-start-stop.gif)

### Animating (Progress)
![demo-animating](https://raw.githubusercontent.com/honghaoz/Swift-CAAnimation-Closure/master/CAAnimation+Closures%20Demo/demo-animating.gif)

# API

### CAAnimation API
```
let animation = CABasicAnimation(keyPath: "strokeEnd")
animation.duration = 2.0
animation.fromValue = 0.0
animation.toValue = 1.0

animation.start = {
    println("Woo, the animation starts!")
    // ...
}

animation.completion = { finished in
    println("Awesome, the animation just finished! :)")
    // ...
}

layer.addAnimation(animation, forKey: "strokeEndAnimation")
```
### CALayer API

```
layer.addAnimationWithCompletion(animation, forKey: "strokeEndAnimation", withCompletion: {finished in
    println("Animation is finished")
})
```

# The MIT License (MIT)

The MIT License (MIT)

Copyright (c) 2015 Honghao Zhang 张宏昊

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
