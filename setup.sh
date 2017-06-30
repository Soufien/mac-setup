# File: setup
#
# This script automates the process of setting up your Mac.
# Please first understand what it does and then customize it to tailor for your needs.

# Install the command line developer tools.
# This is needed for Homebrew, the most popular package manager for OS X.

xcode-select --install

# Check for Homebrew. Install if you don't have it.

if test ! $(which brew); then 
	echo "Installing homebrew..." 
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
	echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
fi 

brew update

# Specify pacakge, or "formula", you want to install using Homebrew.

binaries=(
	python3
	node
	git
	) 

echo "installing binaries..." 
brew install ${binaries[@]}

brew cleanup

# Install Homebrew-cask to manage GUI applications on Mac.

brew install caskroom/cask/brew-cask

# You can use "brew cask search" to search for an app.
# Or you can search apps at http://caskroom.io/search.

# brew cask search visual-studio-code

# Specify apps you want to install

apps=(
	bettertouchtool
	visual-studio-code
	pycharm-ce
	flux
	google-chrome
	alfred
	firefox
	sublime-text
	transmit
	dropbox
	evernote
	rescuetime
	skype
	vlc
	virtualbox
	vagrant
	slack
	iterm2
	owasp-zap
	sequel-pro
	qlcolorcode
	qlstephen
	qlmarkdown
	quicklook-json
	qlprettypatch
	quicklook-csv
	betterzipql
	webpquicklook
	suspicious-package
	keyboardcleantool
	cleanmymac
	spectacle
	calibre
	imageoptim
	robomongo
	mysqlworkbench
	)

# Install apps to /Applications.
# Default is: /Users/$user/Applications.

echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Install oh-my-zs
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install mongod
if test ! $(which mongod); then

    echo "Installing mongodb"
    brew install mongodb

    echo "Creating defautl /data/db directory"
    mkdir -p /data/db

    echo "Granting read/write permission"
    chmod ugo+rw /data/db

    echo "Done."
else
    echo "MongoDB is already installed. Setup is skipped."
fi
