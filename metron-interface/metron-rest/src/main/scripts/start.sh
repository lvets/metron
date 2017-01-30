#!/bin/bash
#
#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
METRON_VERSION=0.3.0
SCRIPTS_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$#" -ne 1 ]; then
  echo "Usage: start.sh <path to application.yml file>"
  echo "Path can be absolute or relative to $SCRIPTS_ROOT"
else
  if [ -z "$MYSQL_CLIENT_HOME" ]; then
    echo MYSQL_CLIENT_HOME is not set
  else
    if [ -z "$HIBERNATE_HOME" ]; then
      echo HIBERNATE_HOME is not set
    else
      java -Dloader.path=$MYSQL_CLIENT_HOME/*,$HIBERNATE_HOME/lib/envers/*,$HIBERNATE_HOME/lib/jpa/*,$HIBERNATE_HOME/lib/required/* -jar $SCRIPTS_ROOT/../lib/metron-rest-$METRON_VERSION.jar --spring.config.location=$1
    fi
  fi
fi