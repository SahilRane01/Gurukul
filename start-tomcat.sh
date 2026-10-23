#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export CATALINA_HOME="$SCRIPT_DIR/tomcat"
export CATALINA_BASE="$SCRIPT_DIR/tomcat"

echo "Building WAR..."
cd "$SCRIPT_DIR" && mvn clean package -DskipTests
cp "$SCRIPT_DIR/target/gurukul.war" "$CATALINA_BASE/webapps/gurukul.war"

echo "Starting Tomcat..."
"$CATALINA_HOME/bin/startup.sh"
echo "Tomcat started. Access the application at: http://localhost:8080/gurukul/"
