# Maintainer: Luke <Infinitybeond1@protonmail.com>

pkgname='nfetch-bin'
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=2.00
pkgrel=0
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
source=("nfetch-$pkgver::https://github.com/Infinitybeond1/nfetch-src/raw/master/nfetch")
makedepends=('wget')

package() {
  install -D "nfetch-$pkgver" "$pkgdir/usr/bin/nfetch"
}

sha256sums=('fda1c196c514a268b56214362fa94a72bc59219847f44b269958c0803e5e1bc7')
