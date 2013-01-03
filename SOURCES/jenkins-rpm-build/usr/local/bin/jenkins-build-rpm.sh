#!/bin/bash
#
# jenkins-build-rpm.sh - Top level script that runs all the commands needed to build an rpm task in Jenkins
#
# If we follow a simple naming convention we can keep the Execute shell command window short
#   - Jenkins job has the same name as the RPM
#

# The undefined env vars are available within the jenkins runtime
# environment where this script will be executed
PROJECT_WORKSPACE="$JENKINS_HOME/jobs/$JOB_NAME/workspace"

# Wipe out any previous artifacts so the archiving done per build
# does not pick up previous build artifacts
if [ -d $PROJECT_WORKSPACE/RPMS ] ; then
    rm -fr $PROJECT_WORKSPACE/RPMS
fi
if [ -d $PROJECT_WORKSPACE/SRPMS ] ; then
    rm -fr $PROJECT_WORKSPACE/SRPMS
fi

# Build the rpm passing in several args from the Jenkins environment
rpmbuild \
    --define "_topdir $PROJECT_WORKSPACE" \
    --define "release `date +%Y%m%d%H%M%S`" \
    -ba SPECS/*.spec