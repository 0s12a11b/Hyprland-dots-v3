#!/bin/bash

STATUS_FILE="/tmp/ciadpi_status"

if [[ -f $STATUS_FILE && $(cat $STATUS_FILE) == "on" ]]; then
  echo '{"text": "", "class": "active"}'
else
  echo '{"text": "", "class": "inactive"}'
fi