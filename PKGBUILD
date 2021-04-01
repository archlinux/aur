pkgname=mambembe-cli-without-keyring-bin
_bin_name=mambembe-cli
pkgver=0.1.0
pkgrel=0
pkgdesc="Opensource Authy command line client (without keyring support)"
arch=('x86_64')
url="https://github.com/jaysonsantos/mambembe"
license=('MIT')
depends=(
  'pacman>5'
)
provides=($_bin_name)
conflicts=($_bin_name)
source=("https://github.com/jaysonsantos/mambembe/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('da0c9503da3f766ee5e68a5376778f04d83e8984d32190a480c3da8ffe607ce1')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${_bin_name}" "${pkgdir}/usr/bin/${_bin_name}"
}
