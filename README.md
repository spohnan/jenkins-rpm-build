jenkins-rpm-build
=================

An RPM containing scripts to assist with configuring Jenkins RPM building projects

Building
=================
Clone this project into PROJECT_DIR

rpmbuild \
    --define "release `date +%Y%m%d%H%M%S`"
    --define "_topdir $PROJECT_DIR/jenkins-rpm-build" \
    -ba SPECS/jenkins-rpm-build.spec
