#!/bin/bash
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Resolve links: $0 may be a link to the Gradle wrapper script itself
PRG="$0"
while [ -h "$PRG" ]; do
    ls=$(ls -ld "$PRG")
    link=$(expr "$ls" : '.*-> \(.*\)$')
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=$(dirname "$PRG")"/$link"
    fi
done

# Save the current directory
SAVED_DIR="$(pwd)"
cd "$(dirname "$PRG")" >/dev/null
APP_HOME="$(pwd)"
cd "$SAVED_DIR" >/dev/null

# Determine the Java command
if [ -n "$JAVA_HOME" ]; then
    if [ -x "$JAVA_HOME/jre/sh/java" ]; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ]; then
        echo "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
        echo "Please set the JAVA_HOME variable in your environment to match the location of your Java installation."
        exit 1
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || {
        echo "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
        exit 1
    }
fi

# Default JVM options
DEFAULT_JVM_OPTS="-Xmx1024m -Xms256m"

# Add Gradle options if needed (e.g., -Dorg.gradle.daemon=true)
GRADLE_OPTS="$GRADLE_OPTS"

# Set the Gradle classpath (path to the wrapper jar)
CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# Execute the Gradle wrapper main class with the JVM options
exec "$JAVACMD" $DEFAULT_JVM_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
