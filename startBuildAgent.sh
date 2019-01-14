#!/bin/bash

BUILD_AGENT_DIR="${HOME}/workspace/buildAgent"

which wget || ( which apt-get && sudo apt-get install wget )
which wget || ( which brew && brew install wget )

function setup_buildAgent {
    mkdir -p $BUILD_AGENT_DIR
    wget --quiet ${SERVER_HOST}/update/buildAgent.zip
    unzip -o buildAgent.zip -d $BUILD_AGENT_DIR
    rm buildAgent.zip
    cat ${HOME}/workspace/buildAgent.properties > $BUILD_AGENT_DIR/conf/buildAgent.properties
}

stat $BUILD_AGENT_DIR/conf/buildAgent.properties || setup_buildAgent
bash $BUILD_AGENT_DIR/bin/agent.sh run
