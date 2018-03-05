# Maintainer: max-k <max-kATpostDOTcom>

_pkgname=git-flow-completion
pkgname=gitflow-bashcompletion-avh
pkgver=0.6.0
pkgrel=1
pkgdesc="Bash completion support for gitflow (AVH-Edition)."
arch=('any')
url="https://github.com/petervanderdoes/${_pkgname}"
license=('MIT')
depends=('bash-completion' 'git' 'gitflow')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('c9750a111e6dc1ed93932b5a095eff3c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm 0644 "${_pkgname}.bash" "$pkgdir/etc/bash_completion.d/gitflow"
}

