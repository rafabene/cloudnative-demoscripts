# Cloud Native Demo scripts

## Requirenments  (MacOS)

    $ brew install gnu-tar
    $ brew install ansible

## Start Minikube

    $ minikube config set memory 16384
    $ minikube config set cpus 6
    $ minikube config set kubernetes-version v1.20.2
    $ minikube start -p demo
    $ minikube profile demo


## Provision the demo

    $ vi provision/vars.yml
    $ ./install-demo.sh