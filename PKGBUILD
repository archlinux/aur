# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=systemd-failmsg
pkgver=1.1
pkgrel=1
pkgdesc='A systemd service and script to send failure emails'
arch=('any')
url='https://github.com/dino-/systemd-failmsg'
license=('ISC')
depends=('bash')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('13d9cf29cc33e3927e0bfb7a42092702ac518d9d89fcc9e443c2409c496b733f')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   cp -r * "${pkgdir}"
}
