#!/bin/sh

SERVICE_NAME="$1"

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi

STATUS=$(/opt/etc/init.d/rc.unslung check "$SERVICE_NAME")
DATE=$(date "+%D %T")

echo "$STATUS" | grep -q "dead"
if [ $? -eq 0 ]; then
    echo "$DATE : $SERVICE_NAME is dead. Attempting to start..."
    /opt/etc/init.d/rc.unslung start "$SERVICE_NAME"
fi
