#!/usr/bin/env bash

if [ "$1" == "stage" ]; then
  BRANCH="adm-test"
  TIER="stage"
elif [ "$1" == "prod" ]; then
  BRANCH="master"
  TIER="prod"
elif [ -z "$1" ]; then
  echo "Usage: $0 [prod|stage]"
  exit 1
fi

helm template ./helm-common \
    --set "global.tier=${TIER}" \
    --set "helm-common.werf.image.my_app=image_id" \
    --set "helm-common.werf.image.my_app2=image_id" \
    --set "_env=${BRANCH}" \
    --set "global.git_branch=${BRANCH}" \
    -f helm-common/values-example.yaml \
    --debug
