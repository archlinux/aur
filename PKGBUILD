# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=go-ipfs-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Global versioned P2P merkledag filesystem"
url="https://ipfs.io"
arch=('x86_64' 'i686')
provides=('ipfs')
license=('MIT')

source_i686=("https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_v${pkgver}_linux-386.zip")
sha256sums_i686=('f59a76083f9ddd2d4c8f2f752702c87c1292676eb148f316f92a70d7e497c2c7')

source_x86_64=("https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_v${pkgver}_linux-amd64.zip")
sha256sums_x86_64=('bc8d3fe88d71f09daf9a3d915e15e9300d77f1086328de55cf7dd89efc8ec32a')

package() {
  install -Dm755 "${srcdir}/ipfs/ipfs" "${pkgdir}/usr/bin/ipfs"
}

# vim:set ts=2 sw=2 et:
