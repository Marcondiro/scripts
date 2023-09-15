#!/usr/bin/env zsh

# Pop-up the installer for command line developers tools
git -v >/dev/null

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path and reload profile if not present already
grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' ~/.zprofile || \
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "\$(/opt/homebrew/bin/brew shellenv)"

# Install brew formulae
/bin/bash -c "curl -fsSL https://raw.githubusercontent.com/Marcondiro/scripts/main/mac_setup/brew_formulaes | xargs brew install"

# Install brew casks
/bin/bash -c "curl -fsSL https://raw.githubusercontent.com/Marcondiro/scripts/main/mac_setup/brew_casks | xargs brew install --cask"

# Install apps from Macapp store
# (not available in hombrew at the time of writing)

#                         Wireguard  iMovie
/bin/bash -c "mas install 1451685025 408981434"
