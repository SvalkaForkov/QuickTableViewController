platform :ios, "8.0"
use_frameworks!

workspace "QuickTableViewController"

target "QuickTableViewControllerTests-iOS" do
  project "QuickTableViewController"
  pod "Nimble", git: "https://github.com/Quick/Nimble.git", commit: "db706fc"
  pod "Quick", git: "https://github.com/Quick/Quick.git", commit: "1503fb0"
end

target :Example do
  project "Example/Example"
  pod "QuickTableViewController", path: "./"
end
