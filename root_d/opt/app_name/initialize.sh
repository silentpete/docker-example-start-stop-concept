#!/bin/sh

function info () {
  echo -e "\e[32mINFO:\e[0m $1"
}

function warn () {
  echo -e "\e[33mWARN:\e[0m $1"
}

function error () {
  echo -e "\e[31mERROR:\e[0m $1"
}

if [[ -z ${FUNCTIONS} ]]; then
  error "The FUNCTIONS environment variable must be set and not be empty."
  exit 1
fi

info "initializing"

for file in $(find "${FUNCTIONS}" -mindepth 1 -maxdepth 1 -type f -name '*.sh' | sort); do
  info "sourcing shell functions file: $(basename ${file})"
  source $file
  if [[ $? -gt 0 ]]; then
    error "An error occurred sourcing function file: $(basename ${file})."
    exit 1
  fi
done

type start >/dev/null
if [[ $? -ne 0 ]];then
  error "Could not locate a 'start' method after your libraries were sourced. " \
       "Please ensure one of your libraries implements a start method."
  exit 1
fi

type stop >/dev/null
if [[ $? -ne 0 ]];then
  error "Could not locate a 'start' method after your libraries were sourced. " \
       "Please ensure one of your libraries implements a start method."
  exit 1
fi

start

trap 'stop' SIGTERM
while true; do read; done
