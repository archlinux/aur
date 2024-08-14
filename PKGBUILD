# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=openbuilds-control-bin
pkgver=1.0.376
pkgrel=1
pkgdesc="Grbl Host / Interface for all CNC style machines running Grbl"
url="https://github.com/OpenBuilds/OpenBuilds-CONTROL"
license=("GPL-3.0-only")
arch=("x86_64")
provides=("openbuilds-control")
conflicts=("openbuilds-control")
depends=('glibc' 'gcc-libs' 'dbus' 'libxdamage' 'nss' 'at-spi2-core' 'cairo' 'alsa-lib' 'libdrm' 'gtk3' 'libxcomposite' 'expat' 'libx11' 'glib2' 'libxfixes' 'libcups' 'libxrandr' 'pango' 'nspr' 'python' 'libxcb' 'mesa' 'libxext' 'libxkbcommon' 'hicolor-icon-theme')
source=("$url/releases/download/v${pkgver}/OpenBuildsCONTROL_${pkgver}_amd64.deb")
sha512sums=('eef65ebaea5fde809112dd46ed4552f1abc0f841368be014aeb4f449b72dbc5c3b992d73b50ac60ceb46fc70fcdc9fb1954e54de91eca37b03dd86af40b15dc8')

package() {
    cd $srcdir
    tar -pxf data.tar.xz -C $pkgdir
    mkdir -p $pkgdir/usr/bin/
    ln -s /opt/OpenBuildsCONTROL/openbuildscontrol $pkgdir/usr/bin/openbuildscontrol
}
