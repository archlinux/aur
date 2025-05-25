# Maintainer: Saffron <qwertysaffron@protonmail.com>
pkgname=m2m
pkgver=1.1
pkgrel=1
pkgdesc="A minimal command line based youtube to audio/any-media-type converter"
arch=(any)
url="https://github.com/Saffron-sh/m2m"
license=("MIT")
depends=('yt-dlp' 'ffmpeg' 'figlet' 'lolcat')
source=("https://raw.githubusercontent.com/Saffron-sh/m2m/main/m2m.sh")
md5sums=("SKIP")
package() {
	install -Dm755 "$srcdir/m2m.sh" "$pkgdir/usr/bin/m2m"
}
