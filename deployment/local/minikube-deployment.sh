#!/usr/bin/env bash
SCRIPT_DIR=$( cd $(dirname "$0") && pwd)

KUBE_RESOURCES_FILE=/tmp/kube-resources.yaml
export JENKINS_CONFIGURATION=`base64 -w0 $SCRIPT_DIR/jenkins-configuration.yaml`
envsubst < "$SCRIPT_DIR/kube-resources.yaml" > ${KUBE_RESOURCES_FILE}

kubectl config use-context minikube
kubectl apply -f ${KUBE_RESOURCES_FILE}