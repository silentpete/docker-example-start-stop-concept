#!/bin/bash
confirm_environment() {
  info "check expected environment variables"
  declare -a arr=(
    "FUNCTIONS"
    # Uncomment to see error message
    # "TEST"
  )
  for var in ${arr[@]}; do
    if [[ $(env | grep -c ${var}) == 0 ]]; then
      error "The ${var} environment variable must be set and not be empty."
      exit 1;
    fi
    info "found env variable: ${var}"
  done
}
