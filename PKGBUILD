pkgname=mambembe-cli-without-keyring-bin
_bin_name=mambembe-cli
pkgver=0.1.1
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
sha256sums=('05ff181d1eb3e5a40b54f0d2988facff7b4768bcb7da4e94fadf92332f3b42b5')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${_bin_name}" "${pkgdir}/usr/bin/${_bin_name}"
}
