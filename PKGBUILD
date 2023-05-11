# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=systemd-failmsg
pkgver=1.5
pkgrel=1
pkgdesc='A systemd service and script to send failure emails'
arch=('any')
url='https://github.com/dino-/systemd-failmsg'
license=('ISC')
depends=('bash')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('393c9e91198075ac0a999c62dbf00231c06c8064751c281fc8f6155ecb38af61')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   cp -r * "${pkgdir}"
}
