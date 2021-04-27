pkgname=cryptodredge
pkgver=0.25.1
pkgrel=1
pkgdesc="Simple in use and highly optimized cryptocurrency mining software with stable power consumption. It is designed to take full advantage of your GPU."
license=('custom')
arch=('x86_64')
url="https://cryptodredge.org/"
provides=('cryptodredge')
conflicts=('cryptodredge')
replaces=('cryptodredge')
depends=('cuda')
source=("${pkgname}-${pkgver}.tar.gz::https://cryptodredge.org/download/linux/10.2/latest")
options=('!strip')

package() {
  install -Dm755 CryptoDredge "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
md5sums=('a9d0c90ed6127740acf692d804f68364')
