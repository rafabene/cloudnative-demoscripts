# Cloud Native Demo scripts

## Requirenments  (MacOS)

    $ brew install gnu-tar
    $ brew install ansible

## Start Minikube

    $ minikube config set memory 8192
    $ minikube config set cpus 3
    $ minikube start -p demo
    $ minikube profile demo


## Provision the demo

    $ vi provision/vars.yml