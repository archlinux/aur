# Maintainer : Stezkoy <stezko@gmail.com>

pkgname=pastemc
pkgdesc="Bash script for paste MasCloud. Fork pbin"
url="https://github.com/Stezkoy/pastemc"
pkgver=1.0
pkgrel=8
arch=('any')
license=("custom")
depends=('bash' 'curl')
makedepends=(git)
source=(${pkgname}::git+https://github.com/Stezkoy/pastemc.git)
md5sums=('SKIP')

package() {
  cd "$srcdir"/pastemc

  install -D -m755 pastemc "$pkgdir/usr/bin/pastemc"

}
