# Maintainer: Luke <Infinitybeond1@protonmail.com>

pkgname='nfetch-bin'
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=2.50
pkgrel=0
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
source=("nfetch-$pkgver::https://github.com/Infinitybeond1/nfetch-src/raw/master/nfetch")
makedepends=('wget')

package() {
  install -D "nfetch-$pkgver" "$pkgdir/usr/bin/nfetch"
}

sha256sums=('6e462f96f707578a7ecc189cfef80d8f0bd432b24faf46bef32407d150987259 ')
