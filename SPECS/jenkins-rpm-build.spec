# Settings that might need to be updated
%define name                  jenkins-rpm-build
%define version               1.0
%define buildroot             %{_topdir}/BUILD/%{name}-%{version}-root

# RPM Header info
Summary: Additional utilities to facilitate building RPMs in Jenkins
Name:      %{name}
Version:   %{version}
Release:   %{release}
BuildArch: noarch
BuildRoot: %{buildroot}
Source:    https://github.com/spohnan/jenkins-rpm-build
URL:       https://github.com/spohnan/jenkins-rpm-build
License:   MIT
requires:  rpm-build, rpmlint, rpmdevtools, createrepo, make, gcc, gcc-c++

%description
Additional utilities to facilitate building RPMs in Jenkins

%prep
exit 0

%build
exit 0

%install
rm -fr %{buildroot}
cp -R %{_sourcedir}/jenkins-rpm-build %{buildroot}

%clean
rm -fr %{buildroot}

%pre
exit 0

%post
exit 0

%files

%defattr(755,root,root)
/usr/local/bin/jenkins-build-rpm.sh


%changelog
* Thu Jan 3 2013 Andrew Spohn <Andy@AndySpohn.com> - 1.0
- First packaging
