#!/bin/sh

check_environment() {
  info "check expected environment variables"
  if [[ -z ${TEST} ]]; then
    error "The TEST environment variable must be set and not be empty.";
    exit 1;
  fi
}
