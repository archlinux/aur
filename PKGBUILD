# Maintainer: Zain Khan <zai1208@protonmail.com>
pkgname=pwss-core-git
pkgver=0.1.0
pkgrel=1
pkgdesc="The mathematical guardian for PWSS. Verifies PGP signatures."
arch=('any')
url="https://github.com/zai1208/pwss-core"
license=('GPL3')
depends=('gnupg')
source=("git+https://github.com/zai1208/pwss-core.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pwss-core"
  install -Dm755 pwss-core "$pkgdir/usr/bin/pwss-core"
}
