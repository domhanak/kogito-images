#!/usr/bin/env bash

if [ "${SCRIPT_DEBUG}" = "true" ] ; then
    set -x
    SHOW_JVM_SETTINGS="-XshowSettings:properties"
    echo "Script debugging is enabled, allowing bash commands and their arguments to be printed as they are executed"
    echo "JVM settings debug is enabled."
fi


# Configuration scripts
# Any configuration script that needs to run on image startup must be added here.
CONFIGURE_SCRIPTS=(
  ${KOGITO_HOME}/launch/kogito-management-console.sh
)
source ${KOGITO_HOME}/launch/configure.sh
#############################################

exec java ${SHOW_JVM_SETTINGS} ${JAVA_OPTIONS} ${KOGITO_MANAGEMENT_CONSOLE_PROPS} \
        -Dquarkus.http.host=0.0.0.0 \
        -jar $KOGITO_HOME/bin/kogito-management-console-runner.jar