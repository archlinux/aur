# Maintainer: robertfoster
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reviewdog-bin
pkgver=0.21.1 # renovate: datasource=github-tags depName=reviewdog/reviewdog
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

sha256sums=('e70aed7f3617605eaccdeeba71042babee65db5268d82c0f6601ed605944b5fe')
