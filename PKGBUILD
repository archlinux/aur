# Maintainer: midlpan <https://github.com/midlpan>
pkgname=radiopt
pkgver=0.1.3
pkgrel=1
depends=('ffmpeg')
pkgdesc="radiopt is a CLI program to listen to Portuguese web radios through the terminal (you can also save the audio in a .mp3 file)"
arch=('any')
url="https://github.com/midlpan/radiopt"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/Latest/radiopt.tar.gz")
sha512sums=('2db30605d9d317c9aa238b1cfad0b016d1308d0dc97760480c0008371b75c9ccb0094c48c262a149c222f7252c3464f92708da932d1e898311bab139646f1692')


package() {
  cd "$srcdir/radiopt"
  install -Dm755 radiopt.sh "$pkgdir/usr/bin/radiopt"
  install -Dm644 logos.sh "$pkgdir/usr/share/radiopt/logos.sh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
