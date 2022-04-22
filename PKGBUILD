# Maintainer: robertfoster
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reviewdog-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='Automated code review tool integrated with any code analysis tools regardless of programming language'
arch=('x86_64')
url="https://github.com/reviewdog/reviewdog"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/reviewdog_${pkgver}_Linux_x86_64.tar.gz")

package() {
  install -Dm644 "${srcdir}"/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}"/reviewdog \
    "${pkgdir}/usr/bin/reviewdog"
}

sha256sums=('bf0ada422e13a94aafb26bcd8ade3ae6d98e6a3db4a9c1cb17686ee64e021314')
