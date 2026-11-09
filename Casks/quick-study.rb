cask "quick-study" do
  version "0.7.0"
  sha256 "81136f9b2a335778bab736b4c2a08d124a054c9a26d78c3bd74e20657ffb84a5"

  url "https://github.com/Abbabon/quick-study/releases/download/v#{version}/QuickStudy-#{version}.zip"
  name "Quick Study"
  desc "Spotlight-style Magic: The Gathering card lookup"
  homepage "https://github.com/Abbabon/quick-study"

  depends_on macos: ">= :sonoma"

  app "QuickStudy.app"

  # The app is ad-hoc signed (not notarized). Homebrew quarantines downloads and
  # no longer offers --no-quarantine, so strip the quarantine attribute here or
  # Gatekeeper would refuse to open it. must_succeed: false because xattr exits
  # non-zero for nested files that never had the attribute.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/QuickStudy.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/QuickStudy",
    "~/Library/Logs/QuickStudy",
    "~/Library/Preferences/com.abbabon.quickstudy.plist",
  ]
end
