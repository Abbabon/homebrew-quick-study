cask "quick-study" do
  version "0.2.0"
  sha256 "0df9bbde1329bfabef5a44da421c37ce946b78b465b70ec0bda65e2b6aa1c631"

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
