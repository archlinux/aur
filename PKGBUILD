# Maintainer: Luke <Infinitybeond1@protonmail.com>

pkgname='nfetch-bin'
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=1.00
pkgrel=1
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
source=("nfetch-$pkgver::https://github.com/Infinitybeond1/nfetch-src/raw/master/nfetch")

package() {
  install -D "nfetch-$pkgver" "$pkgdir/usr/bin/nfetch"
}

sha256sums=('b6d50f5975a49499ef00ef0824420c55c6abf21edb9cfe772918da7836a775c3')
