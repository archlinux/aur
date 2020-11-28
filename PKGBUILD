# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=systemd-failmsg
pkgver=1.0
pkgrel=1
pkgdesc='A systemd service and script to send failure emails'
arch=('any')
url='https://github.com/dino-/systemd-failmsg'
license=('ISC')
depends=('bash')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('20a6fb3c5c2b044f49ddcd8330266e5e08a633de3895181e30f16629959e1f4f')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   mkdir "${pkgdir}/usr"
   cp -r * "${pkgdir}/usr"
}
