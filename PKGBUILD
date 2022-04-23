pkgname=cryptodredge
pkgver=0.27.0
pkgrel=2
pkgdesc="Simple in use and highly optimized cryptocurrency mining software with stable power consumption. It is designed to take full advantage of your GPU."
license=('none')
arch=('x86_64')
url="https://cryptodredge.org/"
provides=('cryptodredge')
conflicts=('cryptodredge')
replaces=('cryptodredge')
depends=('cuda')
source=("${pkgname}-${pkgver}.tar.gz::https://cryptodredge.org/download/linux/11.4/latest")
options=('!strip')

package() {
  install -Dm755 CryptoDredge "${pkgdir}/usr/bin/${pkgname}"
#  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
md5sums=('b70b31e07a651f52e4a3593a1358c6f1')
