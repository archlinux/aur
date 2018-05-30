# Maintainer: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=ipget
pkgver=0.3.0
pkgrel=1
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally."
arch=('i686' 'x86_64' 'arm')
license=('MIT')
optdepends=('go-ipfs: to use full potential of IPFS network')
url="https://github.com/ipfs/ipget"
source_i686=("https://ipfs.io/ipns/dist.ipfs.io/ipget/v${pkgver}/ipget_v${pkgver}_linux-386.tar.gz")
source_x86_64=("https://ipfs.io/ipns/dist.ipfs.io/ipget/v${pkgver}/ipget_v${pkgver}_linux-amd64.tar.gz")
source_arm=("https://ipfs.io/ipns/dist.ipfs.io/ipget/v${pkgver}/ipget_v${pkgver}_linux-arm.tar.gz")
sha256sums_i686=('3d0f4362c2854c879c361df3beaff684e1176c0c203335c55ec7fbbb065f062f')
sha256sums_x86_64=('7143800943834aa8cebdefd8a9fc0f1a6f643983cce6a91c09f643b1b7caf99f')
sha256sums_arm=('fef61c3d562fdd304af800409a87d1abf8de1474bc57f14ad5ff8c2ef712538b')

package() {
  install -Dm755 "${srcdir}/ipget/ipget" "${pkgdir}/usr/bin/ipget"  
}
