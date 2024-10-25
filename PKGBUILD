# Maintainer: Eric Finger <ericfinger at ericfinger dot com>
pkgname=easyroam-desktop-bin
pkgver=1.4.0
pkgrel=0
epoch=0
pkgdesc="Manage and install your easyroam wifi profiles"
arch=('x86_64')
url="https://www.easyroam.de/"
license=('unknown')
depends=('gtk3' 'lz4' 'xz' 'libnm' 'libsecret' 'webkit2gtk-4.1' 'openssl')
provides=('easyroam-desktop')
conflicts=('easyroam-desktop')
source=('http://packages.easyroam.de/repos/easyroam-desktop/pool/main/e/easyroam-desktop/easyroam_connect_desktop-1.4.0%2B1.4.0-linux.deb')
sha256sums=('a4f888fc1cc180eade8ee4c819a2071f445ca1c2026bf2d82d23ebb7e8b0691e')
install=".install"

package() {
	tar -xvf 'data.tar.gz' -C "${pkgdir}"
}
