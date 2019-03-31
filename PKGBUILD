# Maintainer: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname=aurvote-utils
pkgver=1.0.0
pkgrel=1
pkgdesc='A set of utilities for managing AUR votes'
arch=('any')
url=https://github.com/jadenPete/aurvote-utils
conflicts=('aurvote')
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests')
source=("https://github.com/jadenPete/aurvote-utils/archive/v${pkgver}.tar.gz")
sha256sums=('d8b992f836a663584c4b447befc46e47824795143780b4c23d2da8481dc12711')

package() {
	cd "aurvote-utils-${pkgver}"
	install -D aurvote "${pkgdir}/usr/bin/aurvote"
	install aurvote-auto "${pkgdir}/usr/bin/aurvote-auto"
}
