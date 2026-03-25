%global dkms_name    mediatek-mt7927
%global version      %{?_pkg_version}%{!?_pkg_version:0}

Name:           mediatek-mt7927-dkms
Version:        %{version}
Release:        1%{?dist}
Summary:        DKMS WiFi 7 and Bluetooth 5.4 drivers for MediaTek MT7927 (Filogic 380)
License:        GPL-2.0-only
URL:            https://github.com/jetm/mediatek-mt7927-dkms
BuildArch:      noarch

Source0:        %{url}/archive/v%{version}/%{name}-%{version}.tar.gz

BuildRequires:  make
BuildRequires:  curl
BuildRequires:  python3

Requires:        dkms
Requires(post):  dkms
Requires(preun): dkms

Conflicts:      btusb-mt7925-dkms
Conflicts:      btusb-mt7927-dkms

%description
DKMS package for MediaTek MT7927 (Filogic 380) combo WiFi 7 + BT 5.4.

Builds out-of-tree btusb/btmtk (Bluetooth) and mt76 (WiFi) kernel modules
with device IDs and patches not yet in mainline Linux. Supports kernels 6.17+.

When MT7927 support is merged into mainline kernels and linux-firmware,
remove this package to use the in-tree drivers.

%prep
%autosetup -n %{name}-%{version}

%build
make download
make sources SRCDIR=%{_builddir}/%{name}-%{version}/_build

%install
make install \
    SRCDIR=%{_builddir}/%{name}-%{version}/_build \
    DESTDIR=%{buildroot} \
    VERSION=%{version}

%post
dkms add     -m %{dkms_name} -v %{version} --rpm_safe_upgrade &&
dkms build   -m %{dkms_name} -v %{version} --rpm_safe_upgrade &&
dkms install -m %{dkms_name} -v %{version} --rpm_safe_upgrade --force ||
true

%preun
dkms remove -m %{dkms_name} -v %{version} --rpm_safe_upgrade --all || :

%files
%{_usrsrc}/%{dkms_name}-%{version}
%dir /usr/lib/firmware/mediatek/mt6639
%dir /usr/lib/firmware/mediatek/mt7927
/usr/lib/firmware/mediatek/mt6639/BT_RAM_CODE_MT6639_2_1_hdr.bin
/usr/lib/firmware/mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin
/usr/lib/firmware/mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin

%changelog
