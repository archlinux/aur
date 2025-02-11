# Maintainer: Eric Finger <ericfinger at ericfinger dot com>
pkgname=easyroam-desktop-bin
pkgver=1.4.3
pkgrel=0
epoch=0
pkgdesc="Manage and install your easyroam wifi profiles"
arch=('x86_64')
url="https://www.easyroam.de/"
license=('unknown')
depends=('gtk3' 'lz4' 'xz' 'libnm' 'libsecret' 'webkit2gtk-4.1' 'openssl')
provides=('easyroam-desktop')
conflicts=('easyroam-desktop')
source=('http://packages.easyroam.de/repos/easyroam-desktop/pool/main/e/easyroam-desktop/easyroam_connect_desktop-1.4.3%2B1.4.3-linux.deb')
sha256sums=('d373cb0144105a56803bed1c61c0a8adcd50eb0021bcb4065cdbb49aa87c2efc')
install=".install"

package() {
	tar -xvf 'data.tar.gz' -C "${pkgdir}"
}
