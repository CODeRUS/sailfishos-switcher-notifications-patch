Name:       sailfishos-switcher-notifications-patch

BuildArch: noarch

Summary:    Show notifications count in switcher
Version:    0.0.1
Release:    1omp
Group:      Qt/Qt
License:    Other
Source0:    %{name}-%{version}.tar.bz2
Requires:   patchmanager

%description
Show notifications count in switcher


%prep
%setup -q -n %{name}-%{version}

%build

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/share/patchmanager/patches/sailfishos-switcher-notifications-patch
cp -r patch/* %{buildroot}/usr/share/patchmanager/patches/sailfishos-switcher-notifications-patch
mkdir -p %{buildroot}/usr/share/jolla-settings/pages/sailfishos-switcher-notifications-patch
cp -r settings/*.qml %{buildroot}/usr/share/jolla-settings/pages/sailfishos-switcher-notifications-patch
mkdir -p %{buildroot}/usr/share/jolla-settings/entries
cp -r settings/*.json %{buildroot}/usr/share/jolla-settings/entries/

%pre
if [ -f /usr/sbin/patchmanager ]; then
/usr/sbin/patchmanager -u sailfishos-switcher-notifications-patch || true
fi

%preun
if [ -f /usr/sbin/patchmanager ]; then
/usr/sbin/patchmanager -u sailfishos-switcher-notifications-patch || true
fi

%files
%defattr(-,root,root,-)
%{_datadir}/patchmanager/patches/sailfishos-switcher-notifications-patch
%{_datadir}/jolla-settings/entries
%{_datadir}/jolla-settings/pages
