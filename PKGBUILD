# Maintainer: lmartinez-mirror
# Contributor: Isaac Freund <ifreund@ifreund.xyz>
pkgname=zsh-abbr
pkgver=4.3.0
pkgrel=1
pkgdesc='zsh abbreviations, ported from fish and enhanced'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('MIT')
depends=('zsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('c142bdbf20969539f13dc97f565ac1f4b64960cc84e5cdafc05fc53e95471587')

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 ${pkgname}{,.plugin}.zsh -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
  install -vDm 644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
