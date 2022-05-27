# Maintainer: Luke <Infinitybeond1@protonmail.com>

pkgname='nfetch-bin'
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
source=("nfetch-$pkgver::https://github.com/Infinitybeond1/nfetch-src/raw/master/nfetch"
        "config.ini::https://raw.githubusercontent.com/Infinitybeond1/nfetch-src/master/config.ini"
       )
makedepends=('wget')

package() {
  install -D "nfetch-$pkgver" "$pkgdir/usr/bin/nfetch"
  install -D "config.ini" "$pkgdir/usr/share/doc/nfetch/config.ini"
}

sha256sums=('SKIP' 'SKIP')
