# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=agdsn-zsh-config
pkgver=0.4.0
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
sha256sums=('19aa0a2959e6c68b18d0968df741f729ed16888d47d59103927c64a3a6dc250d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 zshrc-home.zsh "$pkgdir/etc/skel/.zshrc"
  install -Dm644 zshrc-base-hw.zsh "$pkgdir/etc/zsh/zshrc"
}

# vim:set ts=2 sw=2 et:
