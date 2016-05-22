# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=ttf-sbl-hebrew
pkgver=1.56a_Build016
pkgrel=1
pkgdesc="SBL Hebrew biblical font."
arch=('any')
url="https://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://www.sbl-site.org/Fonts/SBL_Hbrw.ttf"
        "LICENSE")
sha1sums=('5b0b79e237e62532b81c7626219f232553ec9b95'
          '9d5a3931ce42dce53f245e9a8a0803a7c2c98751')

package() {
  cd "$srcdir"
  install -Dm644 SBL_Hbrw.ttf "$pkgdir/usr/share/fonts/TTF/SBL_Hbrw.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
