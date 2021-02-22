# Maintainer: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wine-stable-ubuntu
pkgver=6.0
pkgrel=4
pkgdesc="A compatibility layer for running Windows programs (binary for Ubuntu)"
arch=('x86_64')
url="https://winehq.org/"
license=('GPL')
conflicts=('wine')
provides=("wine=${pkgver}" "wine-wow64=${pkgver}")
install=wine.install
#Depends: libasound2 (>= 1.0.16), libc6 (>= 2.29), libfaudio0 (>= 19.06.07), libgcc-s1 (>= 3.0), libglib2.0-0 (>= 2.12.0), libgphoto2-6 (>= 2.5.10), libgphoto2-port12 (>= 2.5.10), libgstreamer-plugins-base1.0-0 (>= 1.0.0), libgstreamer1.0-0 (>= 1.4.0), liblcms2-2 (>= 2.2+git20110628), libldap-2.4-2 (>= 2.4.7), libmpg123-0 (>= 1.6.2), libopenal1 (>= 1.14), libpcap0.8 (>= 0.9.8), libpulse0 (>= 0.99.1), libudev1 (>= 183), libusb-1.0-0 (>= 2:1.0.21), libvkd3d1 (>= 1.0), libx11-6, libxext6, libxml2 (>= 2.9.0), ocl-icd-libopencl1 | libopencl1, ocl-icd-libopencl1 (>= 1.0) | libopencl-1.1-1, libasound2-plugins, libncurses6 | libncurses5 | libncurses
depends=('glibc' 'alsa-lib' 'faudio' 'gcc-libs'
	 'glib2' 'libgphoto2' 'gst-plugins-base-libs'
	 'gstreamer' 'lcms2' 'libldap' 'mpg123'
	 'openal' 'libpcap' 'libpulse' 'udev'
	 'libusb' 'vkd3d' 'libx11' 'libxext'
	 'libxml2' 'opencl-icd-loader' 'alsa-plugins'
	 'ncurses'
	 'orc' 'libelf' 'gettext' 'desktop-file-utils'

	 'lib32-glibc' 'lib32-alsa-lib' 'lib32-faudio' 'lib32-gcc-libs'
	 'lib32-glib2' 'lib32-gst-plugins-base-libs'
	 'lib32-gstreamer' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
	 'lib32-openal' 'lib32-libpulse' 'lib32-systemd'
	 'lib32-libusb' 'lib32-vkd3d' 'lib32-libx11' 'lib32-libxext'
	 'lib32-libxml2' 'lib32-opencl-icd-loader' 'lib32-alsa-plugins'
	 'lib32-ncurses'
	 'lib32-orc' 'lib32-libelf' 'lib32-gettext')
# - libpcal libpghoto2-port12 lib32-libgphoto2

#Recommends: libcapi20-3, libcups2, libdbus-1-3, libfontconfig1, libfreetype6, libglu1-mesa | libglu1, libgnutls30 | libgnutls28 | libgnutls26, libgsm1, libgssapi-krb5-2, libjpeg62-turbo | libjpeg8, libkrb5-3, libodbc1, libosmesa6, libpng16-16 | libpng12-0, libsane | libsane1, libsdl2-2.0-0, libtiff5, libv4l-0, libxcomposite1, libxcursor1, libxfixes3, libxi6, libxinerama1, libxrandr2, libxrender1, libxslt1.1, libxxf86vm1
optdepends=(
libcapi
libcups		lib32-libcups
dbus		lib32-dbus
fontconfig	lib32-fontconfig
freetype2	lib32-freetype2
glu		lib32-glu
gnutls		lib32-gnutls
gsm		lib32-gsm
krb5		lib32-krb5
mesa		lib32-mesa
libpng		lib32-libpng
libjpeg6-turbo	lib32-libjpeg6-turbo
sane		lib32-sane
sdl2		lib32-sdl2
libtiff		lib32-libtiff
v4l-utils	lib32-v4l-utils
libxcomposite	lib32-libxcomposite
libxcursor	lib32-libxcursor
libxfixes	lib32-libxfixes
libxi		lib32-libxi
libxinerama	lib32-libxinerama
libxrandr	lib32-libxrandr
libxrender	lib32-libxrender
libxslt		lib32-libxslt
libxxf86vm	lib32-libxxf86vm
lib32-libgphoto2
dosbox
)
options=('!emptydirs' '!strip')
_pkgver="${pkgver}.0"
_channel="focal"
source=("wine.deb::https://dl.winehq.org/wine-builds/ubuntu/dists/focal/main/binary-amd64/wine-stable-amd64_${_pkgver}~${_channel}-1_amd64.deb"
	"wine2.deb::https://dl.winehq.org/wine-builds/ubuntu/dists/focal/main/binary-amd64/wine-stable_${_pkgver}~${_channel}-1_amd64.deb"
	"winei386.deb::https://dl.winehq.org/wine-builds/ubuntu/dists/focal/main/binary-i386/wine-stable-i386_${_pkgver}~${_channel}-1_i386.deb"
	"30-win32-aliases.conf"
        "wine-binfmt.conf")
sha512sums=("224299cf2ae87f6cf0757cab8fec4c0af92fe3207ab87650709ba604132a2771d1877ba5b5cdab40c388ebf1c54d0bc8852126af7e73b4e3f16733a1b12d365b"
            "487737d24e534ea3483b80b498da295c62cad009369ffff3b0de0377bc4f7c21884886457fa7760c7188f88ec6d67075332e33fd071774bde498a3ab3c4c200a"
            "8b50cea9243f0a8801a4092697806a346a2ce6d65b4757c6a894ea4c865a7e554f06fff66714e966e26c8cdf31780726ce8f2ee6c71fa663419d132b2cad2b48"
            "6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb"
            "bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285")

prepare() {
	mkdir "$srcdir"/wine{,2,i386} || :
}

package() {
	msg2 "Extracting the data.tar.xz..."
	for _num in "" 2 i386; do
		bsdtar -xf "$srcdir"/wine${_num}.deb -C "$srcdir"/wine${_num}
		bsdtar -xf "$srcdir"/wine${_num}/data.tar.xz -C "$pkgdir/"
	done
	mv "$pkgdir"/opt/wine-stable "$pkgdir"/opt/wine-stable-ubuntu
	msg2 "Making symlinks..."
	mkdir -p "$pkgdir"/usr/bin
	for _ln in 'function_grep.pl' msidb msiexec notepad regedit regsvr32 widl wine wine-preloader wine64 wine64-preloader wineboot winebuild winecfg wineconsole winecpp winedbg winedump winefile wineg++ winegcc winemaker winemine winepath wineserver wmc wrc; do
		ln -s /opt/wine-stable-ubuntu/bin/"$_ln" "$pkgdir"/usr/bin/"$_ln"
	done
	msg2 "Doing things that related to Arch..."
	install -d "$pkgdir"/etc/fonts/conf.{avail,d}
	install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
	ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
	install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf	"
	install -Dm 644 "$pkgdir"/opt/wine-stable-ubuntu/share/applications/wine.desktop "$pkgdir"/usr/share/applications/wine.desktop
	install -Ddm 755 "$pkgdir"/usr/share/man
	for _man in de.UTF-8 fr.UTF-8 man1 pl.UTF-8; do
		if [ "$_man" == "man1" ]; then
			install -Ddm 755 "$pkgdir"/usr/share/man/"$_man"
			cp -ax "$pkgdir"/opt/wine-stable-ubuntu/share/man/"$_man"/* "$pkgdir"/usr/share/man/"$_man"; continue
		fi
		install -Ddm 755 "$pkgdir"/usr/share/man/"$_man"/man1
		cp -ax "$pkgdir"/opt/wine-stable-ubuntu/share/man/"$_man"/man1/* "$pkgdir"/usr/share/man/"$_man"/man1/
	done
	ln -s "$pkgdir"/opt/wine-stable-ubuntu/share/wine "$pkgdir"/usr/share/wine
	rm -rf "$pkgdir"/opt/wine-stable-ubuntu/share/{man,applications}
	rm -rf "$pkgdir"/usr/share/lintian
}
