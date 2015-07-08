# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=otf-league-gothic
_file=64c3ede
pkgver=20130215
pkgrel=1
pkgdesc="A revival of Alternate Gothic, originally designed by M.F. Benton."
arch=('any')
url="http://www.theleagueofmoveabletype.com/league-gothic"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=($pkgname-$pkgver.zip::http://theleagueof.s3.amazonaws.com/downloads/theleagueof-league-gothic-$_file.zip
        OFL.txt)
sha1sums=('06b3c3d133ee74fe1a0a4ce5760aa50e78783d58'
          '5d2bd43577e6c664887781d7e19a6eec6f07bc8b')

package() {
  cd "$srcdir/theleagueof-league-gothic-$_file"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 ../OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
