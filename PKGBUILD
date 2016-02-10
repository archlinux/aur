# Maintainer icasdri <icasdri at gmail dot com>

pkgname=diff-so-fancy
pkgver=0.1.2
pkgrel=2
pkgdesc="Good-looking diffs with diff-highlight and more"
arch=(any)
url="https://github.com/stevemao/diff-so-fancy"
license=('MIT')
install="${pkgname}.install"
source=("${url}/archive/v${pkgver}.tar.gz")
sha384sums=('fba27fa5762a9fa1748b78a184343a25c075ce1a9e06cff51a8e4992cea3ba71079a9c8279994c992a05ffff091e1802')

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   install -Dm755 'diff-so-fancy' "${pkgdir}/usr/bin/diff-so-fancy"
   install -Dm755 'diff-highlight' "${pkgdir}/usr/bin/diff-highlight"
}
