# Maintainer: Andrey Antufyev <andrey.antufyev@yandex.ru>
pkgname=ascon-kompas3d-v25-study-full
pkgver=25.0.1.2738
pkgrel=1
pkgdesc="CAD software for mechanical engineering"
url="https://kompas.ru/"
arch=("x86_64")
license=("custom")
options=(!strip !debug)
depends=(
	"freetype2"
	"xdg-utils"
	"ttf-opensans"
	"libxxf86vm"
	"libdrm"
	"glu"
	"libglvnd"
	"xcb-util-wm"
	"libxkbfile"
	"libxss"
	"libxv"
	"qt6-base"
	"xcb-util-keysyms"
	"libfontenc"
	"gdk-pixbuf2"
	"libsm"
	"libxpm"
	"libxt"
	"zlib"
	"cairo"
	"at-spi2-core"
	"xcb-util-image"
	"libice"
	"libstdc++"
	"libcups"
	"xcb-util-renderutil"
	"libgcc"
	"glibc"
	"glib2"
	"libwebp"
	"pango"
	"libxmu"
	"hicolor-icon-theme"
	"libxcomposite"
	"libc++abi"
	"libxaw"
	"libxrandr"
	"libxinerama"
	"libxres"
	"libxcursor"
	"libxdamage"
	"libc++"
	"libxcb"
	"libxext"
	"libx11"
	"xcb-util"
	"libxtst"
	"fontconfig"
	"util-linux-libs"
	"libatomic"
	"xcb-util-cursor"
	"libtiff"
	"libxdmcp"
	"libxau"
	"libxi"
	"libxrender"
	"libxfixes"
	"libgtk-x11-2.0.so"
)
source=(
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-helpserver-0.8.1.9-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-checker-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-common-1.0.0.6-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-coupling-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-dimchain-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-featurekompas-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-fonts-1.0.0.7-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-graphic-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-help-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-libsamples-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-nesting-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-plugins-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-sdk-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-servicetools-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-study-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas3d-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-polynom-library-24.0-24.0.0.26061516-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/grdcontrol-4.5.3-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-cable-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-coating3d-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-diecore-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-easysteel-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-ergonomics-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-mouldcore-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-pipeline-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-sdf3dapp-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-splitconnection3d-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-trays-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-tutorials-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-unwrap-v25-25.0.0.14-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-ventilation-v25-${pkgver}-0.x86_64.rpm"
"https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main/ascon-kompas-weldconnect-v25-${pkgver}-0.x86_64.rpm"
)
sha256sums=('01fcf31a7348e853158649703f3d4a992e64049faadb3ee3ef477bd5c1496176'
            'f4cecf64bf9c19dde491d00f44d95086d77103a8973ba1fc718b5b91b5b0b3ae'
            '33e16f2b61c0c9b71e15956e9303dd094be8a6f6bc960659ed8685bbbedfe351'
            '7b02c40dc3ae36b66386f154525b52c878b1a437d24a14b1cf0ba6ed30ff0d9e'
            'ed20cfd73ded5cbeb58bf462b42dba62f9ef26909b8965c6da12c0872ffa897e'
            '8751cb6e14302f9378f3c5e35ef11db30335188652a078fa2854858028d16be7'
            'f8584143474718e3de97ea5a7d88cefb5e2c0b7e0b0c98a5804f9b03dda474a7'
            '2534a5c09e9871c668c0f5a1e2d2c151e39668307aceb6919636e2f522de329f'
            'ac146e3ce78d12cdd77d83efcff355266bcc11024b52cbd8b0bc98a0cc751ec9'
            '1a06e59b189434ab6936a8b28b1a305710913aeedd18ed6721d9725879000b29'
            '834241e688926c765becccae5e4bbd24dc757c42d7a620505c41492dd58eef4b'
            '6ca681d96242be201767acae8212ee251bc680f87cd222c3ced338d4da6ebc94'
            'b72d4bf12433a3097642d702ce06e069d52ab2e9caf651da726ee1a7c105e113'
            'eb87e5af375f05cc5b318f5039f22badba5b1f4c9698c11d91c62cb0326fa0d6'
            '669944df6a1aff05a54dd87ab8abb832d440797bbc3476e2a75126dde4006005'
            '050d9599194d34cd25935b5251b57cddee3890698b915ae82855d721b19a85d8'
            '1803649622b741712b72335f87ec9dfafb6492a8b63ab3161b85f4acc3471598'
            '983e431213cdeea9ac38a633df8acc62f582f01ac5e0d3a1dfa8a8b2b65c77cb'
            'e157c461068c7e3a5a367f8dd7fc50477a4280476d2684d947d01c1b7fe4bd4b'
            'c6e69ed40c7ea5ff82579fe6510918c68edb3f20c9b0365256672d391e8decf2'
            'f3fcb680854eab5c0d3ec2d6f821e803dfe9ef3b6fe4e825a29f0065ec15f619'
            'f55a005f763661db366ae3e368792ac28501bb0ee6efa7b9c381fd6613f52a3e'
            '5298f34a38d15f3f54f0af67ad699c84c157afc86749e50928d8e22f5ee23c6b'
            '202b9354c6d0f7b855fc3cc0956f560995e154e149cce5478c0be0cfc083b813'
            'b2297d09da2c9e796f2a7c433a405fd25919559c8da91d3f4b6c815145197c10'
            'e90d1c4860a10cf2b678cfb4f0262629f9a8e38cc386eb67ef605dfa3fa137df'
            'ba242b602185762bfbed4583f69ab3f6e4431fc987e9ea57fe11a855f24ef45d'
            'ee8fa65b8c77d1ebd746dcf9e073aa9d8c10493baa703fe0f1c646c9a3704c48'
            'acd13b4a5432af1fd5051450e142e0906410a268fafc6150c085392433d60e75'
            '459206e792581b15a219fbc1501a4e5367eb016eb75d68d4dff1a59c9466996e'
            'e220d10d01fbea42c9bdc02c804d319adee92aa3172b941c9e490925035ac2a8'
            '2a236ac1ec6fc171e956058eaafed2a2e2489b1d08a9b2b861d78691d612fd4a')
package() {
	cp -a $srcdir/etc $pkgdir/etc
	cp -a $srcdir/opt $pkgdir/opt
	cp -a $srcdir/usr $pkgdir/usr
	echo "Name[en]=KOMPAS-3D v25" >> "$pkgdir/usr/share/desktop-directories/kompas-25.directory"
	ln -s /usr/lib/libunwind.so "$pkgdir/opt/ascon/kompas3d-v25/Bin/libunwind.so.1"
	chmod +x "$pkgdir/usr/bin/Ascon.HelpServer"
	ln -s "/opt/ascon/kompas3d-v25/Bin/kStudy" "$pkgdir/usr/bin/kompas-study-v25"
	mkdir -m0755 -p "$pkgdir/etc/profile.d"
	echo "export KOMPAS_SDK=/opt/ascon/kompas3d-v25/SDK/" > "$pkgdir/etc/profile.d/ascon-kompas-sdk.sh"
	ln -sn "/opt/ascon/PolynomLibrary" "$pkgdir/opt/ascon/kompas3d-v25/Libs/PolynomLib"
	mkdir -m0755 -p "$pkgdir/etc/udev/rules.d"
	mkdir -m0755 -p "$pkgdir/usr/lib/systemd/system"
	ln -s "/opt/guardant/grdcontrol/license_wizard" "$pkgdir/usr/bin/license_wizard"
	cp "$pkgdir/opt/guardant/grdcontrol/95-grdnt.rules" "$pkgdir/etc/udev/rules.d/"
	cp "$pkgdir/opt/guardant/grdcontrol/grdcontrol.service" "$pkgdir/usr/lib/systemd/system/grdcontrol.service"
}

