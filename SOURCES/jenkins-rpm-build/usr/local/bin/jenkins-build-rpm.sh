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


rpmbuild \
    --define "_topdir $JENKINS_HOME/jobs/$JOB_NAME/workspace" \
    --define "release `date +%Y%m%d%H%M%S`" \
    -ba SPECS/$JOB_NAME.spec