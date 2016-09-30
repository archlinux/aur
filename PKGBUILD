# Maintainer: Simon Marchi <simon.marchi at polymtl dot ca>
pkgname=git-meld-git
pkgver=0.1
pkgrel=1
pkgdesc="A wrapper around git and meld for comparing git trees."
arch=('any')
url="https://github.com/wmanley/git-meld.git"
license=('GPL2')
depends=('meld')
makedepends=('git')
provides=('git-meld')
conflicts=('git-meld')
source=("git+https://github.com/wmanley/git-meld.git")
md5sums=('SKIP')

check() {
  bash "${srcdir}/git-meld/test.sh"
}

package() {
  install -D -m 755 "${srcdir}/git-meld/git-meld.pl" "${pkgdir}/usr/bin/git-meld.pl"
}

# vim:set ts=2 sw=2 et:
