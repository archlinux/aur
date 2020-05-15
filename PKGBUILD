# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reviewdog-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Automated code review tool integrated with any code analysis tools regardless of programming language'
arch=('x86_64')
url="https://github.com/reviewdog/reviewdog"
license=('MIT')
provides=('reviewdog')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/reviewdog_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('6938482e91895bb81955c462faee4f0603dac4864135194f8343330c459ca877')

package() {
	install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}"/reviewdog "${pkgdir}/usr/bin/reviewdog"
}
# vim:set ts=2 sw=2 et: