#!/bin/sh

if [ "${1}" = "/bin/bash" ]
then
  exec /bin/bash
fi

PID=0
cleanup()
{
  kill ${PID}
}
trap cleanup INT
trap cleanup TERM

/opt/backend/server -c /etc/service1/config.toml $* &
PID=$!
wait ${PID}
