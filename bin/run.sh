#!/usr/bin/env bash

echo 'Environment is: '${ENV}

if test "x${ENV}" = 'xdev'; then
  if test "x${APPNAME}" = "xbackend" ; then
    uvicorn appbackend.web:app --host 0.0.0.0 --port 8080 --log-level debug --reload --reload-dir src
  elif test "x${APPNAME}" = "xfrontend" ; then
    uvicorn appfrontend.web:app --host 0.0.0.0 --port 8080 --log-level debug --reload --reload-dir src
  else
    echo "invalid value for envvar APPNAME '${APPNAME}'"
    exit 1
  fi
else
  if test "x${APPNAME}" = "xaccount" ; then
    uvicorn appbackend.web:app --host 0.0.0.0 --port 8080 --log-level info
  elif test "x${APPNAME}" = "xtrade" ; then
    uvicorn appfrontend.web:app --host 0.0.0.0 --port 8080 --log-level info
  else
    echo "invalid value for envvar APPNAME '${APPNAME}'"
    exit 1
  fi
fi