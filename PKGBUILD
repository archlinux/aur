# Maintainer: ColtNovak <mail at coltnovak dot com>
  pkgname=bytefetch
  pkgver=1.0
  pkgrel=1
  pkgdesc='Tiny dependency-free fetch script with 10 fields and ASCII art'
  arch=('any')
  url='https://github.com/ColtNovak/bytefetch'
  license=('GPL-3.0-or-later')
  source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
  sha256sums=('c35322ef816b5fd22a36cf340d259863f319289f403c52de171a83386afcc031')
  package() {
          install -Dm755 "$pkgname-$pkgver/bytefetch" "$pkgdir/usr/bin/bytefetch"
  }
