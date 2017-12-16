# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=ethrun
pkgver=0.2.4
pkgrel=1
pkgdesc="Directly run EVM bytecode"
arch=('x86_64')
url="https://github.com/dapphub/ethrun"
license=(GPL3)
source=(https://github.com/dapphub/ethrun/releases/download/v${pkgver}/ethrun-v${pkgver}-linux.tar.gz)
sha512sums=('52de13065393c665de857451d89f86fcf773822b1da1b26c37e4bd347cedfa83ed948d1eb08c15371100ac0ddcb9c55b54f89f45bb64cdfe7cbbaefb6af01b7e')


package() {
  install -Dm755 ethrun "$pkgdir/usr/bin/ethrun"
}

# vim:set ts=2 sw=2 et:
