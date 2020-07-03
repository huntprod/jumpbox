huntprod/jumpbox
================

A jumpbox for the rest of us (jhunts included)

Usage
-----

To run this in Docker:

    docker run -it huntprod/jumpbox

To run this in Docker, if you are a jhunt:

    docker run -it huntprod/jumpbox:jhunt

To run this in Kubernetes:

    kubectl apply -f https://raw.githubusercontent.com/huntprod/jumpbox/master/k8s/jumpbox.yml
    kubectl exec -it jumpbox /bin/bash

To run this in Kubernetes, if you are a jhunt:

    kubectl apply -f https://raw.githubusercontent.com/huntprod/jumpbox/master/k8s/jhunt.yml
    kubectl exec -it jhunt /bin/bash
