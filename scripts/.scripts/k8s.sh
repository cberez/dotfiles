#!/bin/bash

alias kget_context="kubectl config current-context"

# find pod ID from partial name
get_pod_id() {
  [[ -z "$1" ]] && {
    echo "Usage: get_pod_id <name to find>"
    return 1
  }
  POD_NAME=$1

  echo $(kubectl get pods -n default -o go-template='{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $POD_NAME)
}

# get pod logs
pod_logs() {
  USAGE="Usage: pod_logs <pod name to find> [--follow]"
  POD_NAME=$1
  [[ $POD_NAME == "--follow" ]] && POD_NAME=$2

  [[ -z "$POD_NAME" ]] && {
    echo $USAGE
    return 1
  }

  POD_ID=$(get_pod_id $POD_NAME)
  [[ "$?" == "1" ]] && {
    echo $USAGE
    return $?
  }

  kubectl logs $POD_ID $2
}
alias fpod_logs="pod_logs --follow"

# exec command in pod
pod_exec() {
  USAGE="Usage: pod_exec <pod name to find> command [arguments...]"
  POD_NAME=$1
  COMMAND=${@:2}

  [[ -z "$POD_NAME" || -z "$COMMAND" ]] && {
    echo $USAGE
    return 1
  }

  POD_ID=$(get_pod_id $POD_NAME)
  [[ "$?" == "1" ]] && {
    echo $USAGE
    return $?
  }

  echo "-- context = $(kget_context)"
  echo "-- pod = $POD_ID"
  echo "-- command = $COMMAND"

  kubectl exec -it $POD_ID -- $COMMAND
}

