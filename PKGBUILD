# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=systemd-failmsg
pkgver=1.2
pkgrel=1
pkgdesc='A systemd service and script to send failure emails'
arch=('any')
url='https://github.com/dino-/systemd-failmsg'
license=('ISC')
depends=('bash')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('5e28eb3fe966aadc4463fd375fe260293c080f03ee254202a854dbd8eb7c5402')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   mkdir "${pkgdir}/usr"
   cp -r * "${pkgdir}/usr"
}
