# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Firmicus <firmicus āt gmx dōt net>

pkgname=ttf-sil-ezra
pkgver=2.51
pkgrel=2
pkgdesc="OpenType Hebrew font from SIL."
arch=('any')
url="http://scripts.sil.org/EzraSIL_Home"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("$pkgname-$pkgver.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=EzraSIL251.zip")
sha1sums=('97472305eea615f415c7805ba32da01a6d706283')

package() {
  cd "$srcdir/EzraSIL2.51"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
