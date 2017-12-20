#!/usr/bin/env bash

docker stop mystartmethod

docker rm mystartmethod

docker run -d -t --name=mystartmethod mystartmethod:latest
