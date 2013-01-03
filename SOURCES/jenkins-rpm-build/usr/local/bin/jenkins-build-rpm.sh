#!/bin/bash
#
# jenkins-build-rpm.sh - Top level script that runs all the commands needed to build an rpm task in Jenkins
#
# If all the conventions have been followed this script can be used to keep the Execute shell command window short
#   - Jenkins job has the same name as the RPM
#   - RPM spec file has the same name as the RPM
#
# With these two naming conventions we can now use the Jenkins $JOB_NAME environment var and not have to update
# scripts for each new job. Being able to just copy one task and change the name makes it much easier to set up quickly
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

rpmbuild \
    --define "_topdir $PROJECT_WORKSPACE" \
    --define "release `date +%Y%m%d%H%M%S`" \
    -ba SPECS/$JOB_NAME.spec