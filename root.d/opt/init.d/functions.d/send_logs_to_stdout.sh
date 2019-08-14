#!/bin/bash

# any file you want tailed so it'll show in docker logs

function send_logs_to_stdout() {
  LOGFILE="$APP_HOME/service.log"
  log_created="false"
  while ${log_created}; do
    if [[ -f ${LOGFILE} ]]; then
      log_created="true"
    else
      warn_msg -e "didn't find ${LOGFILE}"
    fi
  done
  info_msg "Sending ${LOGFILE} to stdout"
  tail --pid $$ -F ${LOGFILE} 2>/dev/null &
}
