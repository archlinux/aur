# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=manssh-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Manage your ssh alias configs easily"
arch=('x86_64')
url='https://github.com/xwjdsh/manssh'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/manssh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b88e838dbc75a9a5a4812ef776d4c62e9d69c0c8be7245eaebd9e97023feda14')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}