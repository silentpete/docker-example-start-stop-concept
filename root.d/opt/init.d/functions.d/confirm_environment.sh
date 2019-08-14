#!/bin/bash
function confirm_environment() {
  info_msg "Check expected environment variables"
  # Add not existent var to see error message
  ENV_VARS="
    FUNCTIONS
    "
  for var in ${ENV_VARS}; do
    if [[ $(env | grep -c ${var}) == 0 ]]; then
      error_msg "The ${var} environment variable must be set and not be empty."
    fi
    debug_msg "found env variable ${var}=${!var}"
  done
}
