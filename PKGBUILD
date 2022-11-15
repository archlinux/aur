# Maintainer: Ludvík Pelán <lpelan@email.cz>
pkgname=jami-all-bin
pkgver=20221114.0935.632b2
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms"
arch=('x86_64')
url="https://jami.net"
license=('GPLv3')
groups=('')
depends=('alsa-lib>=1.0.16' 'argon2>=0' 'brotli>=0.6.0' 'dbus-c++>=0.9.0' 'dbus>=1.9.14' 'desktop-file-utils' 'double-conversion>=2.0.0' 'expat>=2.0.1' 'fontconfig>=2.12.6' 'freetype2>=2.11.0' 'gcc-libs>=4.2' 'gdk-pixbuf2>=2.22.0' 'glibc>=2.35' 'glib2>=2.45.3' 'gnupg' 'gst-plugins-base-libs>=1.14.0' 'gstreamer>=1.6.0' 'gtk3>=3.9.10' 'harfbuzz>=2.1.1' 'hicolor-icon-theme' 'jsoncpp>=1.9.5' 'krb5>=1.17' 'lcms2' 'libcups>=1.4.0' 'libdrm>=2.4.62' 'libfbclient>=2.5.0.25784.ReleaseCandidate1.ds2' 'libglvnd' 'libice>=1.0.0' 'libinput>=0.15.0' 'libjpeg6-turbo>=1.5.0' 'libnatpmp>=20150609' 'libnm>=1.0.0' 'libnotify>=0.7.0' 'libpng>=1.6.2' 'libpulse>=0.99.1' 'libsm' 'libtiff>=4.0.3' 'libva>=2.2.0' 'libvdpau>=0.2' 'libvpx>=1.12.0' 'libwebp' 'libxcb>=1.15' 'libxcomposite>=0.4.5' 'libxdamage>=1.1' 'libxext' 'libxfixes' 'libxkbcommon-x11>=0.5.0' 'libxkbcommon>=0.5.0' 'libxkbfile>=1.1.0' 'libxml2>=2.9.0' 'libxrandr' 'libxshmfence' 'libxtst' 'libx11>=1.8.1' 'mariadb-libs>=3.0.0' 'mesa>=8.1' 'minizip>=1.1' 'mtdev>=1.0.8' 'nettle>=3.7.' 'nspr>=4.9' 'nss>=3.22' 'openssl>=3.0.0' 'opus>=1.1' 'pcre2>=10.22' 'postgresql-libs>=9.2beta3' 'qrencode>=3.2.0' 'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-svg' 'qt6-tools' 'qt6-webengine' 'qt6-webchannel' 'qt6-5compat' 're2>=20201101' 'snappy>=1.1.9' 'speexdsp>=1.2.1' 'speex>=1.2.' 'systemd-libs>=183' 'unixodbc>=2.3.1' 'util-linux-libs>=2.16' 'xcb-util-image>=0.2.1' 'xcb-util-keysyms>=0.4.0' 'xcb-util-renderutil' 'xcb-util-wm>=0.4.1' 'xz>=5.1.1alpha' 'yaml-cpp>=0.7.0' 'zlib>=1.2.3.3' 'zstd>=1.5.2' 'icu71')
conflicts=('jami-qt' 'jami-daemon' 'jami-qt-git' 'jami-daemon-git' 'jami-gnome-git' 'libjamiclient-git')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://dl.jami.net/ring-manual/debian_unstable/jami-all_amd64.deb")
sha512sums_x86_64=('5bcc75af1809372fbd3658615ac5a01f352eb30a6541c5e4b9a7b2eb3236ada81aa3bfb933d9e09db80ea0718849b3e4ec0fc512e58970e99282e7893885df19')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/jami-all/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 

}
