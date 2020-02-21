# Maintainer: Munzir Taha <munzirtaha at gmail.com>
# Contributor: Wyegu <bsdazs17 at gmail dot com>
# Contributor: Firmicus <firmicus at gmx dot net>
pkgname=ttf-sil-scheherazade
pkgver=2.100
pkgrel=4
pkgdesc="An Arabic Naskh-style Unicode typeface"
arch=('any')
url="https://software.sil.org/scheherazade/"
license=('custom:OFL')
source=("https://software.sil.org/downloads/r/scheherazade/Scheherazade-$pkgver.zip")
sha256sums=('251c8817ceb87d9b661ce1d5b49e732a0116add10abc046be4b8ba5196e149b5')

package() {
  cd "$srcdir/Scheherazade-$pkgver"
  install -Dm644 Scheherazade-Regular.ttf Scheherazade-Bold.ttf -t ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 OFL.txt OFL-FAQ.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm644 README.txt FONTLOG.txt documentation/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
