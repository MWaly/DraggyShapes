Pod::Spec.new do |s|
  s.name         = "DraggyShapes"
  s.version      = "0.9"
  s.summary      = "Create custom UIView objects where you can drag , rotate and move with very few lines , monthly maintenance planned"
  s.homepage     = "https://github.com/MWaly/DraggyShapes"

  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = { "Mohamed Waly" => "mohamed.mokhles@gmail.com" }
  s.source       = { 
    :git => "https://github.com/MWaly/DraggyShapes.git",
    :tag => "v0.9"
  }

  s.platform     = :ios, '7.0'
  s.source_files = 'DraggyNotes/DraggyNotes/DraggyShapes/ControlDefinitions.h'

  s.framework    = 'UIKit', 'Foundation','QuartzCore'
  s.requires_arc = true
end