# Maintainer: max-k <max-kATpostDOTcom>

_pkgname=git-flow-completion
pkgname=gitflow-bashcompletion-avh
pkgver=0.5.2
pkgrel=2
pkgdesc="Bash completion support for gitflow (AVH-Edition)."
arch=('any')
url="https://github.com/petervanderdoes/${_pkgname}"
license=('MIT')
depends=('bash-completion' 'git' 'gitflow')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('d77ee72fa52d141ffbb4018079446cba')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm 0644 "${_pkgname}.bash" "$pkgdir/etc/bash_completion.d/gitflow"
}

