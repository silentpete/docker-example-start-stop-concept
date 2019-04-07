#!/bin/bash

# any file you want tailed so it'll show in docker logs

send_logs_to_stdout() {
  LOGFILE="$APP_HOME/service.log"
  log_created="false"
  while $log_created; do
    if [[ -f $LOGFILE ]]; then
      log_created="true"
    else
      warn -e "didn't find ${LOGFILE}"
    fi
  done
  info "sending ${LOGFILE} to stdout"
  tail --pid 0 -F ${LOGFILE} 2>/dev/null &
}
