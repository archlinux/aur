# Maintainer: Luke <Infinitybeond1@protonmail.com>

pkgname='nfetch-bin'
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=1.02
pkgrel=1
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
source=("nfetch-$pkgver::https://github.com/Infinitybeond1/nfetch-src/raw/master/nfetch")

package() {
  install -D "nfetch-$pkgver" "$pkgdir/usr/bin/nfetch"
}

sha256sums=('f42cdba8b5c04d344706eeeca2d762182355c8c8495b49cf4e0a415b5b8c325d')
