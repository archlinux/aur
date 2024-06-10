# Maintainer: Eric Finger <ericfinger at ericfinger dot com>
pkgname=easyroam-desktop-bin
pkgver=1.3.5
pkgrel=0
epoch=0
pkgdesc="Manage and install your easyroam wifi profiles"
arch=('x86_64')
url="https://www.easyroam.de/"
license=('unknown')
depends=('gtk3' 'lz4' 'xz' 'libnm' 'libsecret' 'webkit2gtk-4.1')
provides=('easyroam-desktop')
conflicts=('easyroam-desktop')
source=('http://packages.easyroam.de/repos/easyroam-desktop/pool/main/e/easyroam-desktop/easyroam_connect_desktop-1.3.5%2B1.3.5-linux.deb')
sha256sums=('4d1cc43cf8ec0f5f9e4ae125bdb4d5e072457f07d2f841feaff3a174c3fc286d')
install=".install"

package() {
	tar -xvf 'data.tar.xz' -C "${pkgdir}"
}
