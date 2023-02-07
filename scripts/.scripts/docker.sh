#!/bin/bash

function restart_svc {
  SVC_NAME=$1

  docker stop dev_${SVC_NAME}_1
  docker rm dev_${SVC_NAME}_1
  docker compose up -d $SVC_NAME
}
