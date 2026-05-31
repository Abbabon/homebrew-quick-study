cask "quick-study" do
  version "0.1.0"
  sha256 "2afa2225066d6fdfe13a829d93e8fedb2df737f64d00c431a38606c20d3ea235"

  url "https://github.com/Abbabon/quick-study/releases/download/v#{version}/QuickStudy-#{version}.zip"
  name "Quick Study"
  desc "Spotlight-style Magic: The Gathering card lookup"
  homepage "https://github.com/Abbabon/quick-study"

  depends_on macos: ">= :sonoma"

  app "QuickStudy.app"

  zap trash: [
    "~/Library/Application Support/QuickStudy",
    "~/Library/Logs/QuickStudy",
    "~/Library/Preferences/com.abbabon.quickstudy.plist",
  ]
end
