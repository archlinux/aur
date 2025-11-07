#Maintainer: Saffron <just.saffron@protonmail.com>
pkgname=m2m
pkgver=2.3.4
pkgrel=1
pkgdesc="A is a minimal command line based youtube to audio/any-media-type converter"
arch=(any)
url="https://github.com/Saffron-sh/m2m"
license=("MIT")
depends=('yt-dlp' 'ffmpeg' 'jq')
source=("https://raw.githubusercontent.com/Saffron-sh/m2m/main/m2m.sh"
	"https://raw.githubusercontent.com/saffron-sh/m2m/main/m2m.1.gz")
md5sums=("SKIP" "SKIP")
package() {
	install -Dm755 "$srcdir/m2m.sh" "$pkgdir/usr/bin/m2m"
	install -Dm644 "$srcdir/m2m.1.gz" "$pkgdir/usr/share/man/man1/m2m.1.gz"
}
