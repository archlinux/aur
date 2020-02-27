# Maintainer: Shiwei Wang <wsw0108@qq.com>
pkgname=org-protocol-emacsclient
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Register emacsclient as an org-protocol handler program"
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('emacs')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('org-protocol-emacsclient.desktop')
md5sums=('b7d13b0379e8dd81ce71ed407a78042a')
noextract=()

package() {
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 "org-protocol-emacsclient.desktop" "${pkgdir}/usr/share/applications/org-protocol-emacsclient.desktop"
}
