#!bin/zsh

# install command line tools
xcode-select --install

# validate x-code
xcode-select -p
softwareupdate --all --install --force

# validate command line tools
/Library/Developer/CommandLineTools/usr/bin/clang --version






# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"






# set your .zshrc
cd
cat > .zshrc << EOF
    alias ll='ls -l'
    alias swagger-up='cd ~/docker/swagger/ && docker-compose up'
    alias swagger-down='cd ~/docker/swagger/ && docker-compose down'

    alias mysql-up='cd ~/docker/mysql/ && docker-compose up'
    alias mysql-down='cd ~/docker/mysql/ && docker-compose down'

    alias mongo-up='cd ~/docker/mongo/ && docker-compose up'
    alias mongo-down='cd ~/docker/mongo/ && docker-compose down'

    alias redis-up='cd ~/docker/redis/ && docker-compose up'
    alias redis-down='cd ~/docker/redis/ && docker-compose down'

    alias rabbit-up='cd ~/docker/rabbitMQ/ && docker-compose up'
    alias rabbit-down='cd ~/docker/rabbitMQ/ && docker-compose down'

    alias kafka-up='cd ~/docker/kafka/ && docker-compose up'
    alias kafka-down='cd ~/docker/kafka/ && docker-compose down'

    alias elasticsearch-up='cd ~/docker/elasticsearch/ && docker-compose up'
    alias elasticsearch-down='cd ~/docker/elasticsearch/ && docker-compose down'

    #export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-15.jdk/Contents/Home/
    #export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-17.jdk/Contents/Home/
    
    export PATH="/usr/local/sbin:$PATH"
    export PATH=$PATH:$JAVA_HOME/bin
    export PATH="/usr/local/Cellar/:$PATH"
    export SDKMAN_DIR="$HOME/.sdkman"
    export PATH

    # Standard plugins can be found in $ZSH/plugins/
    # Custom plugins may be added to $ZSH_CUSTOM/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    plugins=(git zsh-completions kubectl)

    git config --global user.email "concrain@gmail.com"
    git config --global user.name "concrain"

    if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
    fi

    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
EOF
cat .zshrc
source ~/.zshrc

# if error on insecure directories run
# compaudit
# sudo chmod -R 755 <directory> ex... /usr/local/share/
# then resource







# install brew [ this should also install x-code and comand tools ]
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# validate the install
brew doctor




brew install zsh-completion
	### if you need to force rebuild
	# rm -f ~/.zcompdump; compinit
		
	### if you get "zsh compinit: insecure directories"
	# chmod -R go-w '/usr/local/share/zsh'





# install basic command-line tools
brew install wget
brew install tree
brew install htop





# build tools
brew install git
brew install maven




# https://caskroom.github.io/
  brew install cask
  brew tap homebrew/cask-versions
  brew tap homebrew/cask
  brew doctor

  brew install --cask adoptopenjdk8
  brew tap adoptopenjdk/openjdk
  brew search adoptopenjdk


   ### if error with multiple casks ###
   # rm /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-versions/Casks/adoptopenjdk8.rb


  brew install --cask adoptopenjdk11
  brew install --cask adoptopenjdk15

  # not available yet
  #brew install --cask adoptopenjdk17


##################################
   ### if your brew branch is off master ###
   #brew update-reset
   #brew update
   #brew doctor
##################################




# install sdkman
  curl -s "https://get.sdkman.io" | bash
  source .zshrc

  sdk version
  sdk install gradle
  sdk install groovy
  sdk install springboot
  sdk install grails
  sdk install micronaut





# install node
  brew install node





# install jhipster
  npm install -g generator-jhipster





# install postman
brew install --cask postman
open /Applications/Postman.app

# install sourcetrail
brew install --cask sourcetrail
open /Applications/Sourcetrail.app

# install intellij
brew install --cask intellij-idea
open /Applications/Intellij\ IDEA.app

# install vscode
brew install --cask visual-studio-code
open /Applications/Visual\ Studio\ Code.app

# install atom
brew install --cask atom
open /Applications/Atom.app

# install dbeaver
brew install --cask dbeaver-community
open /Applications/Dbeaver.app

# install brackets
brew install --cask brackets
open /Applications/Brackets.app

# install bootstrap-studio
brew install --cask bootstrap-studio
open /Applications/Bootstrap\ Studio.app




# install kubernetes

  # install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 && \
chmod +x minikube && \
sudo mv minikube /usr/local/bin/

  # hyperkit driver
brew install hyperkit
minikube config set vm-driver hyperkit


  # command line controls
brew install kubectl
	### if docker is already linked ###
        # brew link --overwrite kubernetes-cli

  # check proxy
curl --proxy "" https://cloud.google.com/container-registry/

  # start - no proxy needed
minikube delete
minikube start

  # check the config file
kubectl config use-context minikube
cat ~/.kube/config
kubectl cluster-info

	### example...
	### -> Kubernetes control plane is running at https://192.168.64.2:8443
	### -> CoreDNS is running at https://192.168.64.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

minikube dashboard

  # stop 
minikube stop






# install lens
brew install --cask lens
open /Applications/Lens.app






# install docker
brew install --cask docker && brew install bash-completion docker-completion docker-compose-completion
open /Applications/Docker.app
brew link --overwrite docker-completion
brew doctor
docker run -d -p 80:80 docker/getting-started






# install hoverfly api service
  # https://docs.hoverfly.io/en/latest/
  # https://www.infoq.com/articles/service-virtualization-hoverfly-java/
  brew install SpectoLabs/tap/hoverfly
  brew upgrade hoverfly
  hoverctl version

  hoverctl start
  hoverctl logs
  hoverctl stop




