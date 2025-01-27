#!bin/bash

echo "enter your password:"
read -s password

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

alias show-cmds='cd && cat alias-config.txt'

alias ll='ls -l'



alias casandra-up='cd ~/docker/casandra/ && docker-compose up'
alias casandra-down='cd ~/docker/casandra/ && docker-compose down'

alias mysql-up='cd ~/docker/mysql/ && docker-compose up'
alias mysql-down='cd ~/docker/mysql/ && docker-compose down'

alias postgres-up='cd ~/docker/postgres/ && docker-compose up'
alias postgres-down='cd ~/docker/postgres/ && docker-compose down'

alias mongo-up='cd ~/docker/mongo/ && docker-compose up'
alias mongo-down='cd ~/docker/mongo/ && docker-compose down'

alias redis-up='cd ~/docker/redis/ && docker-compose up'
alias redis-down='cd ~/docker/redis/ && docker-compose down'




alias rabbit-up='cd ~/docker/rabbitMQ/ && docker-compose up'
alias rabbit-down='cd ~/docker/rabbitMQ/ && docker-compose down'

alias kafka-up='cd ~/docker/kafka/ && docker-compose up'
alias kafka-down='cd ~/docker/kafka/ && docker-compose down'



alias nginx-up='cd ~/docker/nginx/ && docker-compose up && sh runner-cmd.sh'
alias nginx-cli='cd ~/docker/nginx && docker-compose run cli'
alias nginx-down='cd ~/docker/nginx/ && docker-compose down'

alias oauth2-up='cd ~/docker/oauth2/ && docker-compose up'
alias oauth2-down='cd ~/docker/oauth2/ && docker-compose down'

alias swagger-up='cd ~/docker/swagger/ && docker-compose up'
alias swagger-down='cd ~/docker/swagger/ && docker-compose down'



alias prometheus-up='cd ~/docker/prometheus/ && docker-compose up && sh runner-cmd.sh'
alias prometheus-down='cd ~/docker/prometheus/ && docker-compose down'

alias grafana-up='cd ~/docker/grafana/ && docker-compose up && sh runner-cmd.sh'
alias grafana-down='cd ~/docker/grafana/ && docker-compose down'



alias efk-up='cd ~/docker/efk/ && docker-compose up && sh runner-cmd.sh'
alias efk-down='cd ~/docker/efk/ && docker-compose down'

alias elk-up='cd ~/docker/elk/ && docker-compose up && sh runner-cmd.sh'
alias elk-down='cd ~/docker/elk/ && docker-compose down'


alias solr-up='cd ~/docker/solr/ && docker-compose up && sh runner-cmd.sh'
alias solr-down='cd ~/docker/solr/ && docker-compose down'

alias elasticsearch-up='cd ~/docker/elasticsearch/ && docker-compose up && sh runner-cmd.sh'
alias elasticsearch-down='cd ~/docker/elasticsearch/ && docker-compose down'



alias jaeger-up='cd ~/docker/jaeger/ && docker-compose up && sh runner-cmd.sh'
alias jaeger-down='cd ~/docker/jaeger/ && docker-compose down'



alias openproject-up='cd ~/docker/openproject/ && docker-compose up -d && sh runner-cmd.sh'
alias openproject-down='cd ~/docker/openproject/ && docker-compose down'



alias zeppelin-up='cd ~/docker/zeppelin/ && sh start-zeppelin.sh && sh runner-cmd.sh'
alias zeppelin-down='cd ~/docker/zeppelin/ && docker stop zeppelin'



alias nifi-up='cd ~/docker/nifi/ && docker-compose up && sh runner-cmd.sh'
alias nifi-down='cd ~/docker/nifi/ && docker-compose down'



alias zookeeper-up='cd ~/docker/zookeeper/ && docker-compose up && sh runner-cmd.sh'
alias zookeeper-cli='cd ~/docker/zookeeper/ && docker-compose up exec zookeeper-cli zkCli.sh -server zookeeper:2181'
alias zookeeper-down='cd ~/docker/zookeeper/ && docker-compose down'



# function to switch Java versions
  # switch_java 8
  # switch_java 21
switch_java() {
    if [[ $1 == "8" ]]; then
        export JAVA_HOME=/usr/local/opt/openjdk@8
    elif [[ $1 == "21" ]]; then
        export JAVA_HOME=/usr/local/opt/openjdk@21
    else
        echo "Usage: switch_java 8|21"
        return 1
    fi
    export PATH=$JAVA_HOME/bin:$PATH
    echo "Switched to Java $1"
}

export JAVA_HOME=/usr/local/opt/openjdk@8
export VCPKG_ROOT="$HOME/vcpkg"
export PATH="/usr/local/bin:/usr/local/sbin:$JAVA_HOME/bin:/usr/local/Cellar:$VCPKG_ROOT:/usr/local/anaconda3/bin:$PATH"
export SDKMAN_DIR="$HOME/.sdkman"



# standard plugins can be found in $ZSH/plugins/
# custom plugins may be added to $ZSH_CUSTOM/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git kubectl docker)

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
# then re-source




# install brew    [ this should also install x-code and comand tools ]

##################################
 ### if your brew branch is off master ###
 #brew update-reset
 #brew update
 #brew doctor
##################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# validate the install
brew doctor

# install basic command-line tools
brew install wget
brew install tree
brew install htop

# create diagrams/graphs   https://graphviz.org/
brew install graphviz
# cli youtube downloader   https://github.com/ytdl-org/youtube-dl
brew install youTube-dl


# https://caskroom.github.io/
brew install cask
brew tap homebrew/cask-versions
brew tap homebrew/cask
brew doctor
### if error with multiple casks ###
# rm /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-versions/Casks/adoptopenjdk8.rb


# install java
brew install openjdk@8
brew install openjdk@21
# symlinks needed for the os to locate JAVA_HOME
sudo mkdir -p /Library/Java/JavaVirtualMachines
sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
sudo ln -sfn /usr/local/opt/openjdk@21/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk




casks=(
  wireshark
  postman
  google-chrome
  slack
  docker
  openlens
  brackets
  bootstrap-studio
  dbeaver-community
  atom
  visual-studio-code
  intellij-idea-ce
  sourcetrail
  obs
  anaconda
)
for cask in "${casks[@]}"; do
  echo " installing $cask..."
  echo "$password" | sudo -S brew install --cask $cask
done




# install sdkman
curl -s "https://get.sdkman.io" | bash
source .zshrc

sdk version
sdk install gradle
sdk install groovy
sdk install springboot
sdk install grails
sdk install micronaut



# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
rustc --version
# install the package manager for rust
cargo --version

# install go
brew install go
go version

# verify c++ version from xcode
clang++ --version
# package manager for c++
git clone https://github.com/microsoft/vcpkg "$HOME/vcpkg"
cd "$HOME/vcpkg"
./bootstrap-vcpkg.sh
vcpkg --version

# install python
brew reinstall python
which python3
# package manager simular to maven
brew install poetry
poetry --version
# package manager that can handle python and other languages [ used in datascience ]
# brew install --cask anaconda
conda --version





  # install node
#brew install node
  # install jhipster   https://www.jhipster.tech/
#npm install -g generator-jhipster




# build tools
brew install git
brew install maven
mvn -v


# automation tool   https://docs.ansible.com/
brew install ansible
ansible --version


# infrastructure tool   https://developer.hashicorp.com/terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
terraform --version

# java performance/load testing java applications   https://jmeter.apache.org/
brew install jmeter




# install docker
# brew install --cask docker
brew install docker
brew install docker-compose

brew doctor

# open the desktop app
open /Applications/Docker.app

# run test container
docker run -d -p 80:80 --name docker-demo docker/getting-started




# kubernetes
  # install minikube
brew install minikube
minikube version

minikube addons enable metrics-server

# use docker vs hypervisor as default engine
minikube config set driver docker
eval $(minikube docker-env)
minikube status

# command line controls
brew install kubectl

# start - no proxy needed
minikube delete
minikube start



# test sample service
kubectl delete deployment hello-minikube
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
kubectl set image deployment/hello-minikube echoserver=k8s.gcr.io/echoserver:1.10

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



# install istio ~ service mesh for Kubernetes
# https://kishoreteach.medium.com/set-up-istio-on-minikube-in-5-steps-get-sample-application-up-and-running-8396daf30dd6
brew install istioctl
istioctl version



# load testing for kubernetes    https://k6.io/
brew install k6
k6 version



  # demo to get started
#istioctl install --set profile=demo -y
  # verify demo is installed
#kubectl get pods -n istio-system

  # install lens ~ IDE for kubernetes
# brew install --cask openlens
open /Applications/OpenLens.app






# install postman ~ local api development and testing, with security features
# brew install --cask postman
open /Applications/Postman.app


# install hoverfly ~ local api mocking, recording, replaying api server traffic
  # https://docs.hoverfly.io/en/latest/
  # https://www.infoq.com/articles/service-virtualization-hoverfly-java/
brew install hoverfly
  # run mocked data
   #hoverfly -webserver -import simulation.json
   #hoverfly -webserver -listen-on-port 8050
   #curl http://localhost:8500/api/v2/health

 # run through a proxy
   #hoverfly

 # stop the server
   #hoverfly -stop

 # cli
   #hoverctl start
   #hoverctl stop

   #hoverctl mode capture
   #hoverctl mode simulate

   #hoverctl export simulation.json
   #hoverctl import simulation.json

   #hoverctl health
   #hoverctl logs
   #hoverctl version




# install wireshark ~ network traffic monitoring tool, packet analyzer
# brew install --cask wireshark
open /Applications/Wireshark.app


# install obs ~ screencast and record video
# brew install --cask obs
Open /Applications/OBS.app




# install sourcetrail
# brew install --cask sourcetrail
open /Applications/Sourcetrail.app

# install intellij
# brew install --cask intellij-idea-ce
open /Applications/IntelliJ\ IDEA\ CE.app

# install vscode
# brew install --cask visual-studio-code
open /Applications/Visual\ Studio\ Code.app

# install atom
# brew install --cask atom
open /Applications/Atom.app

# install dbeaver
# brew install --cask dbeaver-community
open /Applications/Dbeaver.app




# install bootstrap-studio
# brew install --cask bootstrap-studio
open /Applications/Bootstrap\ Studio.app

# install brackets
# brew install --cask brackets
open /Applications/Brackets.app
