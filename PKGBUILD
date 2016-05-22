# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=ttf-sbl-greek
pkgver=1.00_Build010
pkgrel=1
pkgdesc="SBL Greek biblical font."
arch=('any')
url="https://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://www.sbl-site.org/Fonts/SBL_grk.ttf"
        "LICENSE")
sha1sums=('12c99111cae4e7958b0645297cf6c53587a96dce'
          '9d5a3931ce42dce53f245e9a8a0803a7c2c98751')

package() {
  cd "$srcdir"
  install -Dm644 SBL_grk.ttf "$pkgdir/usr/share/fonts/TTF/SBL_grk.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
