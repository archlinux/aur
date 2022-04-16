# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=agdsn-zsh-config
pkgver=0.4.2
pkgrel=1
pkgdesc="AG DSN Zsh Config"
arch=('any')
url='https://github.com/agdsn/agdsn-zsh-config'
license=('GPL2')
depends=('zsh' 'coreutils' 'grep' 'sed' 'procps')
makedepends=('git')
conflicts=('grml-zsh-config')
provides=('grml-zsh-config' 'grmlzshrc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agdsn/agdsn-zsh-config/archive/v${pkgver}.tar.gz")
sha256sums=('4ffcce7ebe51439d20bb0c033c0154a7c8a498217d9781f507cdfe6a0928fa2a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 zshrc-home.zsh "$pkgdir/etc/skel/.zshrc"
  install -Dm644 zshrc-base-hw.zsh "$pkgdir/etc/zsh/zshrc"
}

# vim:set ts=2 sw=2 et:
