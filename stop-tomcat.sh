#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export CATALINA_HOME="$SCRIPT_DIR/tomcat"
"$CATALINA_HOME/bin/shutdown.sh"
