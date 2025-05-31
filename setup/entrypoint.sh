#!/bin/sh

# Create log directory if it doesn't exist
mkdir -p /var/log/authelia

# Run Authelia binary with any passed arguments, redirect logs to file and stdout
/app/authelia "$@" 2>&1 | tee -a /var/log/authelia/authelia.log
