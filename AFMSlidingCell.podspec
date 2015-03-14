Pod::Spec.new do |s|
  s.name             = "AFMSlidingCell"
  s.version          = "1.0.0"
  s.summary          = "UITableViewCell subclass with ability to add sliding buttons below cell content"
  s.description      = <<-DESC
                       UITableViewCell subclass that can be used for adding one or two buttons below cell
                       content. Buttons can be revealed by pan gesture, support different sizes and can
                       be even easily controled within the code. It's an easy way to add cool menu buttons
                       to any cell.
                       DESC
  s.homepage         = "https://github.com/ask-fm/AFMSlidingCell"
  s.screenshots     = "https://raw.githubusercontent.com/ask-fm/AFMSlidingCell/master/res/sliding_cell.gif", "https://raw.githubusercontent.com/ask-fm/AFMSlidingCell/master/res/sliding_cell.png"
  s.license          = 'MIT'
  s.author           = { "Artjoms Haleckis" => "artjoms.haleckis@ask.fm" }
  s.source           = { :git => "https://github.com/ask-fm/AFMSlidingCell.git", :tag => s.version.to_s }
  s.social_media_url = 'https://ask.fm/crazyjooe'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.frameworks = 'UIKit'
end
