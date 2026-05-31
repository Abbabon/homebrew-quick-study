# Homebrew Tap — Quick Study

A Homebrew tap for [Quick Study](https://github.com/Abbabon/quick-study), a
Spotlight-style Magic: The Gathering card lookup for macOS.

## Install

```sh
brew install --cask --no-quarantine Abbabon/quick-study/quick-study
```

`--no-quarantine` is required: the app is ad-hoc signed (not notarized), so
without it macOS Gatekeeper refuses to open it.

After installing, launch Quick Study and grant **Accessibility** permission when
prompted (System Settings → Privacy & Security → Accessibility) so the global
hotkey works.

> Apple Silicon (arm64) only.

## Update

```sh
brew upgrade --cask quick-study
```

## Uninstall

```sh
brew uninstall --cask quick-study           # remove the app
brew uninstall --zap --cask quick-study     # also remove cached data & images
```
