#!/bin/bash

start() {
  confirm_environment
  config_app
  start_app
  send_logs_to_stdout
}
