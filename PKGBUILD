# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="protonkey"
pkgver=1.0.1
pkgrel=1
pkgdesc="ProtonMail PGP Key Downloader"
arch=("any")
url="https://git.tebibyte.media/emma/protonkey"
license=("AGPL3")
source=("https://git.tebibyte.media/emma/protonkey/archive/1.0.1.tar.gz")
provides=("protonkey")

sha256sums=("SKIP")

package() {
  cd "$srcdir/protonkey"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  cp protonkey "$pkgdir/usr/bin"
  cp protonkey.1 "$pkgdir/usr/share/man/man1"
}
