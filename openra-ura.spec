#
# spec file for package openra
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#


Name:           openra-ura
# Next is the commit number, see https://github.com/RAunplugged/uRA for the number, or run
# git rev-list --branches master --count, after git pull origin master
Version:        431
%define commit 128dc53741fae923f4af556f2293ceaa0cf571f0
%define engine_version unplugged-cd82382
Release:        0
Url:            https://github.com/RAunplugged/uRA
Summary:        A modified (or unplugged) Red Alert mod for the OpenRA game engine
License:        GPL-3.0+
Group:          Amusements/Games/Strategy/Real Time
Source:         https://github.com/RAunplugged/uRA/archive/%{commit}.tar.gz
Source2:        engine-%{engine_version}.tar.gz
Source3:        openra-ura
Source4:        openra-ura.appdata.xml
Source5:        openra-ura.png
Source6:        openra-ura.desktop
Patch1:         exec-test-fix.patch
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch
BuildRequires:  desktop-file-utils
BuildRequires:  python
BuildRequires:  dos2unix
BuildRequires:  git
BuildRequires:  hicolor-icon-theme
BuildRequires:  shared-mime-info
BuildRequires:  pkgconfig(mono)
Requires:       SDL2
%if 0%{?suse_version}
BuildRequires:  fdupes
BuildRequires:  lua51
BuildRequires:  lua51-libs
Requires:	lua51-libs
Requires:       freetype2
%endif
%if 0%{?suse_version} <= 4310
# workaround System.DllNotFoundException: libgdiplus-devel.so
Requires:       libgdiplus-devel
%endif
%if 0%{?fedora_version}
BuildRequires:  lua = 5.1
Requires:       lua = 5.1
Requires:       freetype
%endif
%if 0%{?mageia}
%ifarch i586
BuildRequires:  liblua5.1
Requires	liblua5.1
Requires:       libfreetype2
Requires:       libsdl2.0_0
%endif
%ifarch x86_64
BuildRequires:  lib64lua5.1
Requires	lib64lua5.1
Requires:       lib64freetype2
Requires:       lib64sdl2.0_0
%endif
Requires:	lua5.1
%endif
Requires:       mono-core
Requires:       openal-soft
Requires:       xdg-utils
Requires:       zenity
%if 0%{?suse_version} >= 4310
Requires(pre):  group(games)
Requires(pre):  user(games)
%endif

# don't provide the bundled dependencies to other packages
AutoReqProv:    off

%description
OpenRA is an Open Source, Real Time Strategy game engine.
This is an OpenRA mod developed in the style of Command &
Conquer: Red Alert with some customization.

%prep
%setup -q -n uRA-%{commit} -a2
%patch1 -p1
dos2unix *.md
make version VERSION="Master commit %{version}"

%build
tar xf %{SOURCE2}
sed -i -e '/fetch-engine/d' Makefile
cd engine
%if 0%{?fedora} || 0%{?rhel}
sed -i -e 's|target=".*"|target="liblua-5.1.so"|g' Eluant.dll.config
%endif
%if 0%{?mageia}
sed -i -e 's|target=".*"|target="liblua.so.5.1"|g' Eluant.dll.config
%endif
%if 0%{?suse_version}
sed -i -e 's|target=".*"|target="liblua5.1.so.5.1"|g' Eluant.dll.config
%endif
sed -i -e '/fetch-geoip-db/d' Makefile
make
cd -
make

%install
mkdir -p %{buildroot}/usr/{lib/%{name}/mods,bin,share/pixmaps,share/doc/packages/%{name},share/applications,share/appdata}
install -dm775 %{buildroot}/var/games/%{name}
cp -r engine/{glsl,lua,AUTHORS,COPYING,Eluant.dll*,FuzzyLogicLibrary.dll,GeoLite2-Country.mmdb.gz,'global mix database.dat',ICSharpCode.SharpZipLib.dll,launch-dedicated.sh,launch-game.sh,MaxMind.Db.dll,OpenAL-CS.dll,OpenAL-CS.dll.config,Open.Nat.dll,OpenRA.Game.exe,OpenRA.Platforms.Default.dll,OpenRA.Server.exe,OpenRA.Utility.exe,rix0rrr.BeaconLib.dll,SDL2-CS.dll,SDL2-CS.dll.config,SharpFont.dll,SharpFont.dll.config,VERSION} %{buildroot}/usr/lib/%{name}
cp -r mods/ura %{buildroot}/usr/lib/%{name}/mods
cp -r engine/mods/{common,modcontent} %{buildroot}/usr/lib/%{name}/mods
install -Dm755 %{SOURCE3} %{buildroot}/usr/bin/%{name}
cp -r %{SOURCE4} %{buildroot}/usr/share/appdata/%{name}.appdata.xml
cp -r README.md %{buildroot}/usr/share/doc/packages/%{name}/README.md
cp -r %{SOURCE5} %{buildroot}/usr/share/pixmaps/%{name}.png
install -Dm644 %{SOURCE6} %{buildroot}/usr/share/applications/%{name}.desktop

rm %{buildroot}/usr/lib/%{name}/*.sh

%if 0%{?suse_version}
%fdupes %{buildroot}%{_prefix}/lib
rm -rf /var/games
%endif

mkdir -p %{buildroot}%{_localstatedir}/games/%{name}/ModMetadata/

%check
make test

%clean
make clean

%post
%desktop_database_post
%icon_theme_cache_post
%mime_database_post

%preun
mono usr/lib/%{name}/OpenRA.Utility.exe ura --unregister-mod system

%postun
%desktop_database_postun
%icon_theme_cache_postun
%mime_database_postun

%posttrans
mono usr/lib/%{name}/OpenRA.Utility.exe ura --register-mod %{_bindir}/%{name} system

%files
%defattr(-,root,root)
%doc README.md
%if 0%{?fedora} || 0%{?rhel}
%{_datadir}/doc/packages/%{name}/README.md
%endif
%{_bindir}/%{name}
%{_prefix}/lib/%{name}/
%{_datadir}/applications/*.desktop
%{_datadir}/pixmaps/%{name}.png
%dir %{_datadir}/appdata/
%{_datadir}/appdata/%{name}.appdata.xml
%if 0%{?suse_version}
%dir %{_localstatedir}/games
%endif
%attr(0775,games,games) %dir %{_localstatedir}/games/%{name}
%ghost %{_localstatedir}/games/%{name}/ModMetadata/
%if 0%{?mageia}
%{_docdir}/packages/%{name}/README.md
%endif

%changelog
