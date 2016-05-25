# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=ipget
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally."
arch=('i686' 'x86_64' 'arm')
license=('MIT')
optdepends=('go-ipfs: to use full potential of IPFS network')
url="https://github.com/ipfs/ipget"

source_i686=("https://ipfs.io/ipns/dist.ipfs.io/ipget/v${pkgver}/ipget_v${pkgver}_linux-386.tar.gz")
sha256sums_i686=("c17b48e910e82b3c33ec580b07bbf7c4cb3a90ea8d303a09db364ca0becd73a8")

source_x86_64=("https://ipfs.io/ipns/dist.ipfs.io/ipget/v${pkgver}/ipget_v${pkgver}_linux-amd64.tar.gz")
sha256sums_x86_64=("42feb6e5f77e5529501f62d52dad0a875595e003ee8ea8f56f91f962cf77c526")

source_arm=("https://ipfs.io/ipns/dist.ipfs.io/ipget/v${pkgver}/ipget_v${pkgver}_linux-arm.tar.gz")
sha256sums_arm=("fd5b458e862e1b81a1dd03d1c764f838d12634c5e6ea4642dea76dbd82ae982f")


package() {
  install -Dm755 "${srcdir}/ipget/ipget" "${pkgdir}/usr/bin/ipget"  
}
