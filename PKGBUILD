# Maintainer: Eric Finger <ericfinger at ericfinger dot com>
pkgname=easyroam-desktop-bin
pkgver=1.3.2
pkgrel=2
epoch=0
pkgdesc="Manage and install your easyroam wifi profiles"
arch=('x86_64')
url="https://www.easyroam.de/"
license=('unknown')
depends=('gtk3' 'lz4' 'xz' 'libnm' 'libsecret')
provides=('easyroam-desktop')
conflicts=('easyroam-desktop')
source=('http://packages.easyroam.de/repos/easyroam-desktop/pool/main/e/easyroam-desktop/easyroam_connect_desktop-1.3.2%2B1.3.2-linux.deb')
sha256sums=('5c63d23f8c8f3473be1e3fe69de0c96557206f8f1a39ee53ac8d1ff8c5da73f1')
install=".install"

package() {
	tar -xvf 'data.tar.xz' -C "${pkgdir}"
}
