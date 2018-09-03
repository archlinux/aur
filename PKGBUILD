# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=container-diff
pkgver=0.11.0
pkgrel=1
pkgdesc="Diff your Docker containers"
arch=(x86_64)
url="https://github.com/GoogleCloudPlatform/container-diff"
license=('Apache')
depends=('glibc')
source=(https://storage.googleapis.com/container-diff/v${pkgver}/container-diff-linux-amd64)
sha512sums=('5e8a5c9461a41d1f44a4eb5b5fdb0f06ae4f159e60a217dd1334dfa0532e056c7183ba0c4eb22920d8158a9984c36a382b854f7711e1f9da67836b585e776bad')

package() {
  chmod +x container-diff-linux-amd64
  install -D -m0755 container-diff-linux-amd64 "${pkgdir}/usr/bin/container-diff"
}



