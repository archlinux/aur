# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=systemd-failmsg
pkgver=1.4
pkgrel=1
pkgdesc='A systemd service and script to send failure emails'
arch=('any')
url='https://github.com/dino-/systemd-failmsg'
license=('ISC')
depends=('bash')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('b2bae2028d9f50f4e8a5aaf57b30f5a657ede16c065df4f32d570ae8e260c9cb')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   mkdir "${pkgdir}/usr"
   cp -r * "${pkgdir}/usr"
}
