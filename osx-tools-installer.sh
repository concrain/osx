#!bin/bash

# install brew [ this should also install x-code and comand tools ]
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# validate the install
brew doctor

# validate x-code
  xcode-select -p

# install basic command-line tools
brew install wget
brew install curl
brew install tree
brew install htop

brew install xhyve

brew install git
brew install tig
brew install maven

# install docker with xhyve and docker machine
# https://pilsniak.com/how-to-install-docker-on-mac-os-using-brew/
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
docker-machine create default --driver xhyve --xhyve-experimental-nfs-share
# set the default docker machine
eval $(docker-machine env default)
# start docker
brew services start docker-machine
docker version
#docker-machine start default

brew install nmap
brew install links
brew install geoip
brew install irssi
brew install bash-completion
brew install watch

# https://caskroom.github.io/
brew install cask 

# manage java with homebrew
brew install jenv
brew cask search java

# install JDK
brew cask install java8
# TODO extract the version as a variable
java -version

# set your .bash_profile
cd
cat > .bash_profile << EOF
    alias ll='ls -l'

    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
    export PATH=$PATH:$JAVA_HOME/bin

    export PATH="/usr/local/bin:$PATH"

    export PATH="/usr/local/Cellar/:$PATH"

    export SDKMAN_DIR="$HOME/.sdkman"

    export PATH="$HOME/.npm-packages/bin:$PATH"
    export PATH="$HOME/usr/local/lib/node_modules/bin:$PATH"

    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin

    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
EOF
cat .bash_profile
source ~/.bash_profile

# update ruby
  \curl -sSL https://get.rvm.io | bash -s stable
  rvm list known
  rvm install ruby-x.x.x
  ruby -v

# install go
  brew install go
  $ECHO $GOPATH

# add additional development tools
  # govendor = a dependency management tool
	go get -u github.com/kardianos/govendor

  # golint = the static analysis tool
	go get -u github.com/golang/lint/golint

  go report card = generate a health report


# install sdkman
  curl -s "https://get.sdkman.io" | bash
  cd
  source .bash_profile

  sdk version
  sdk install gradle
  sdk install groovy
  sdk install springboot
  sdk install grails

# install node
  brew install node
  echo prefix=~/.npm-packages >> ~/.npmrc
  chown -R <user-name> /usr/local/lib/node_modules/
  brew postinstall node 

# swagger api code generator
  # https://swagger.io/docs/swagger-tools/#installation-11
  brew install swagger-codegen		
    swagger-codegen			# start application
    swagger-codegen help
    swagger-codegen generate -i http://petstore.swagger.io/v2/swagger.json -l spring
