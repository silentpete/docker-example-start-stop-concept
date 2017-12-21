#!/bin/sh

# any file you want tailed so it'll show in docker logs

send_logs_to_stdout() {
  info "sending logs to stdout"
  #tail --pid $$ --lines=0 -F $APP_HOME/log/app.log 2>/dev/null &
}
