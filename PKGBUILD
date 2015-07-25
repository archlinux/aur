# Maintainer: bitwave <aur [aTt] oomlu [d0t] de>
pkgname='ttf-monoid'
pkgdesc='Open Source coding font'
pkgver=latest
pkgrel=1
arch=('any')
license=('custom:MIT')
url='http://andreaslarsen.github.io/monoid/'
source=("https://cdn.rawgit.com/larsenwork/monoid/release/Monoid-Small-0-1-3-l.zip")
conflicts=('ttf-monoid-git')
sha512sums=('f7a8e07f170e84dfe2402dd7c02e558be162929531fa4cc53153a77ce97b812667019a76065baf58e36d47644aaa298cc1325684b50ca75ab62ec32ca1538671')

package () {
	install -Dm644 "Monoid-Regular-Small-0-1-3-l.ttf" "${pkgdir}/usr/share/fonts/TTF/Monoid-Regular.ttf"
  install -Dm644 "Monoid-Bold-Small-0-1-3-l.ttf" "${pkgdir}/usr/share/fonts/TTF/Monoid-Bold.ttf"
  install -Dm644 "Monoid-Oblique-Small-0-1-3-l.ttf" "${pkgdir}/usr/share/fonts/TTF/Monoid-Oblique.ttf"
  install -Dm644 "Monoid-Retina-Small-0-1-3-l.ttf" "${pkgdir}/usr/share/fonts/TTF/Monoid-Retina.ttf"
	install -Dm644 "Readme+License.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}