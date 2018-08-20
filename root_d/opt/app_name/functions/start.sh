#!/bin/bash
start() {
  confirm_environment
  config_app
  send_logs_to_stdout
  start_app
}
