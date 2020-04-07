# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=duci-bin
pkgver=0.8.15
pkgrel=1
pkgdesc="The simple ci server"
arch=('x86_64')
url='https://github.com/duck8823/duci'
license=('MIT')
provides=('duci')
source=("${url}/releases/download/v${pkgver}/duci_${pkgver}_linux_amd64.tar.gz")
md5sums=('53823f353ab009c4657490a234b6c7db')

package() {
  install -Dm755 "${srcdir}"/duci "${pkgdir}/usr/bin/duci"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/duci/LICENSE"
}