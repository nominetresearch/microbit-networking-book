%define pkg_name microbit-networking-online

%define maj 0
%define min 1
# release is set by build_rpm.sh, which knows more about environment
%define rel %{_build_version}

%define buildroot %{_tmppath}/%(echo ${USER})/rpmbuild_install/%{pkg_name}-%{version}-%{rel}


Summary: micro:bit networking book online
Name: %{pkg_name}
Version: %{maj}.%{min}
Release: %{rel}
License: Restricted
BuildRoot:	%{buildroot}
URL: http://www.nominet.uk
Prefix: /var/www/html
BuildArchitectures: noarch
Requires: /usr/sbin/httpd

Packager: anthony.kirby@nominet.uk
Vendor: Nominet UK

%define app_user apache
%define app_group apache

%description
micro:bit networking book online

#----------------------------------------------------------------------------
%prep
# clean from previous build
if [ "%{buildroot}" != "" ]; then %__rm -rf %{buildroot}; fi


#----------------------------------------------------------------------------
%build
# no build required


#----------------------------------------------------------------------------
%pre
# check for app_user/group
getent group %{app_group} > /dev/null
if [  $? -ne 0 ]; then
  echo "Install failed - need to create group \"%{app_group}\" before installation"
  exit 1
fi
getent passwd %{app_user} > /dev/null
if [  $? -ne 0 ]; then
  echo "Install failed - need to create user \"%{app_user}\" before installation"
  exit 1
fi


#----------------------------------------------------------------------------
%install
%define srcdir $SOURCE_DIR

# data directory
mkdir -p %{buildroot}%{prefix}/networking-book-online

# config to force downloads as hex
mkdir -p %{buildroot}/etc/httpd/conf.d
cp %{srcdir}/networking-book-online.conf %{buildroot}/etc/httpd/conf.d/
cp %{srcdir}/networking-book-online.htaccess %{buildroot}%{prefix}/networking-book-online/.htaccess


# add all files
cp -r %{srcdir}/exported_source/mkdocs_rendering/site/* %{buildroot}%{prefix}/networking-book-online/

#----------------------------------------------------------------------------
%clean
# delete temporary build & install files
if [ "%{buildroot}" != "" ]; then rm -rf %{buildroot}; fi


#----------------------------------------------------------------------------
%files
%defattr(0444, root, root, 0755)

/etc/httpd/conf.d/networking-book-online.conf
%{prefix}/networking-book-online/

#----------------------------------------------------------------------------
%post
/sbin/service httpd reload &>/dev/null


#----------------------------------------------------------------------------
%preun


#----------------------------------------------------------------------------
# %changelog
# see subversion & release notes

