# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=dapp
pkgver=0.7.9
pkgrel=4
pkgdesc="Simple tool for creating Ethereum-based dapps"
arch=('any')
url="https://github.com/dapphub/dapp/"
license=(GPL3)
depends=(nodejs solidity bc curl git jshon ethabi ethrun seth)
source=(https://github.com/dapphub/dapp/archive/v${pkgver}.tar.gz)
sha512sums=('d6269145ce83e95b7765a4918a6879d93f733bb6bec9d56355bea3a61e3f7915dc1056e4adc6a62cc00ac87dcc59c73a4d88a60e4e3bd4d99d13efb979d6080c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir ${pkgdir}/usr
  make prefix=${pkgdir}/usr install
}

# vim:set ts=2 sw=2 et:
