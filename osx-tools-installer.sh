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

brew install protobuf
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest


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

# Pod:	runs a single application container
#   Single instance of an application process
#   Smallest unit of deployment; ephemeral and can be rescheduled
  kubectl get pods -n default
  kubectl delete pod <name>

  kubectl run <pod-name> --image=<image-name>
  kubectl expose pod <pod-name> --type=<service-type> --port=<port>

# Deployment:  manages a set of pods (replicas)
#   Manages multiple pods over time
#   Ensures desired number of pods are running, handles scaling and updates
  kubectl get deployments -n default
  kubectl delete deployment <name>

  kubectl create deployment <name> --image=
  kubectl expose deployment <name> --type=

# Service:	provides a stable access point to a set of pods
#   A group of pods, abstracted via a network endpoint
#   Load balancing, DNS resolution, and access point for pods
  kubectl get services -n default
  kubectl delete service <name>
  # --name=<service-name> name the service you are creating  [ you dont run kubectl create service <name> ]
  kubectl expose pod <pod-name> --name=<service-name> --port=<port> --type=NodePort

  # --type=NodePort is only used for MINIKUBE on a local machine
  # production environments (e.g., GKE, EKS, AKS) might use different service types, such as:
    # LoadBalancer: For automatic external load balancing (with cloud integration)
    # ClusterIP: For internal-only access within the Kubernetes cluster




  # install minikube
brew install minikube
minikube version

# command line controls
brew install kubectl
# changes will take effect upon a minikube delete and then a minikube start
minikube delete
minikube start
minikube status

# check resources available
kubectl describe node minikube
minikube delete
# allocate memory and cpu
minikube start --memory=8192 --cpus=4


minikube addons enable metrics-server
# verify the metrics webserver
kubectl get pods -n kube-system
kubectl get apiservices | grep metrics
kubectl top nodes
kubectl top pods


# docker vs hyperit as default engine
# minikube start --driver=docker
# minikube config set driver docker

brew install hyperkit
hyperkit -version

minikube start --driver=hyperkit
minikube config set driver hyperkit
# changes will take effect upon a minikube delete and then a minikube start
minikube delete
minikube start
# docker-env is how kubernetes connects to docker
eval $(minikube docker-env)
echo $(minikube docker-env)
minikube status


# test sample service
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
kubectl expose deployment hello-minikube --type=NodePort --port=8080
minikube service hello-minikube

# check running services
kubectl get svc
# inspect running pods
kubectl get pods -o wide
# manually access the NodePort   [ this should automatically happen when the service is started ]
minikube ip
# http://<minikube-ip>:<port>

# update the sevice to different version  1.10 ->
kubectl set image deployment/hello-minikube echoserver=k8s.gcr.io/echoserver:1.10


# use-context
  # you might have different clusters to interact with [ minikube, development, staging, production ]
  # you can switch between these clusters without manually editing your kubeconfig file
  # the command kubectl config use-context minikube sets the active context to your Minikube cluster
  # to switch to another named cluster using kubectl config use-context, the cluster must already be defined in your kubeconfig file
kubectl config use-context minikube
# kubectl config use-context staging
# kubectl config use-context production

# check the config file
cat ~/.kube/config
kubectl cluster-info




# install istio ~ service mesh for Kubernetes
# https://kishoreteach.medium.com/set-up-istio-on-minikube-in-5-steps-get-sample-application-up-and-running-8396daf30dd6
brew install istioctl
  # istioctl install --set profile=default -y
  istioctl install --set profile=demo -y
kubectl get pods -n istio-system

# enable sidecar injection  [ namespace default is the local cluster config. you can have other.. staging, production ]
kubectl label namespace default istio-injection=enabled
  # if sidecar has already been enabled but the cluster has restarted
  kubectl label namespace default istio-injection=enabled --overwrite
# restart pods with sidecars
kubectl delete pod --all -n default
# verify sidecars   [ istio-injection=enabled ]
kubectl get pods -n default --show-labels


# you must delete the existing deployment because is was not spun-up with istio
kubectl get deployments -n default
kubectl get services -n default

# delete
kubectl delete deployment hello-minikube
kubectl delete service hello-minikube
# create
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
kubectl expose deployment hello-minikube --type=NodePort --port=8080
# confirm
kubectl get pods -n default
kubectl get pods -n istio-system -l app=istio-ingressgateway


# create new test deployment to load balance and canary with istio ingressgateway
# deploy the following services:
  # productpage (shows product details)
  # ratings (stores product ratings)
  # reviews (stores reviews)
  # details (provides product details)
kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/bookinfo/platform/kube/bookinfo.yaml

# WAIT: for all sevices to start
kubectl get pods -n default

# expose the productpage service using istio ingressgateway
# create an istio gateway and configure it to route traffic to the correct services (in this case, the productpage service)
kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/bookinfo/networking/bookinfo-gateway.yaml

# expose the service via istio ingressgateway
# NAME                   TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)                                      AGE
# istio-ingressgateway   LoadBalancer   10.103.74.52   <pending>     15021:30505/TCP,80:30654/TCP,443:30801/TCP   19h
  # EXTERNAL-IP: will route traffic to your app. the port used by istio ingressgateway is typically 80
  # MINIKUBE NOTE: minikube uses a NodePort, look for port 80    [ 80:<node-port> ]
kubectl get svc istio-ingressgateway -n istio-system

# access the productpage by navigating to the EXTERNAL-IP of the ingress gateway:
  # MINIKUBE NOTE: get the cluster ip
  minikube ip
# MINIKUBE CMD
http://<minikube-ip>:<nodeport>/productpage
# KUBERNETES CMD
http://<external-ip>/productpage

# enable istio traffic management
# this splits the traffic between two versions of the reviews service (v1 and v2), giving you a basic canary deployment setup
# yaml file location:  </Users/concrain/git/istio-gateway/virtualservice.yaml>
kubectl apply -f virtualservice.yaml
# view the load ballencer through the logs
  # reviews service (stores reviews)
  kubectl get pods -n default -l app=reviews
  # get details of pod
  kubectl describe pod <service-name> -n default
  kubectl describe pod reviews-v1-5c4d6d447c-sfqtw  -n default
  # tail a pod
  kubectl logs -f <service-name> -c istio-proxy -n default
  kubectl logs -f reviews-v1-5c4d6d447c-sfqtw -c istio-proxy -n default




# load testing for kubernetes    https://k6.io/
brew install k6
k6 version


# demo to get started
istioctl install --set profile=demo -y
# verify demo is installed
kubectl get pods -n istio-system


minikube dashboard
# install lens ~ IDE for kubernetes
# brew install --cask openlens
open /Applications/OpenLens.app


# delete sample service
kubectl delete deployment hello-minikube
kubectl delete service hello-minikube

minikube stop






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
