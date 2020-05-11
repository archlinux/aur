# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=duci-bin
pkgver=0.8.15
pkgrel=1
pkgdesc="The simple ci server"
arch=('x86_64')
url='https://github.com/duck8823/duci'
license=('MIT')
provides=('duci')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/duci_${pkgver}_linux_amd64.tar.gz")
sha256sums=('982a1a04b54899f8aab50d96a3b9646c0b15f0d831a8ccfc024032ddf9838a40')

package() {
  install -Dm755 "${srcdir}"/duci "${pkgdir}/usr/bin/duci"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/duci/LICENSE"
}