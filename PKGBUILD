# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=skm-bin
pkgver=0.8
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager"
arch=('x86_64')
url='https://timothyye.github.io/skm'
license=('MIT')
provides=("${pkgname%-bin}")
source=("https://github.com/TimothyYe/skm/releases/download/V${pkgver}/skm-linux64-${pkgver}.tar.gz")
sha256sums=('7ede4eec2495dc346b412cd44baf8600cb84702c0623ef8dd9492bdb1cc34894')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
}