# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reviewdog-bin
pkgver=0.9.17
pkgrel=1
pkgdesc='Automated code review tool integrated with any code analysis tools regardless of programming language'
arch=('x86_64')
url="https://github.com/reviewdog/reviewdog"
license=('MIT')
provides=('reviewdog')
source=("${url}/releases/download/v${pkgver}/reviewdog_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('0a0fc436093d4ac321360294bf280500')

package() {
	cd "${srcdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/reviewdog/LICENSE"
	install -Dm755 reviewdog "${pkgdir}/usr/bin/reviewdog"
}
# vim:set ts=2 sw=2 et: