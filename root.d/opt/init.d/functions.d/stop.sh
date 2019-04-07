#!/bin/bash

stop() {
  info "received SIGTERM"
  stop_app
  info "Gracefull Shutdown"
  exit 0
}
