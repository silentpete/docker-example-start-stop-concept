#!/usr/bin/env bash

type docker >/dev/null
rc=$?
if [[ ${rc} -ne 0 ]]; then
  echo "did not find docker, is it installed? is it running?"
  exit $rc
fi

if [[ $(docker ps -a --format="{{.Names}}" | grep -c mystartmethod) -gt 0 ]]; then
  docker kill mystartmethod
  docker rm mystartmethod
fi

docker run -dit --name=mystartmethod -e MSG_LEVEL=debug --log-driver=json-file mystartmethod:latest
