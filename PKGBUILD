# Maintainer: New9c <aimccccccccc@gmail.com>
pkgname='OKey'
pkgver=$(curl -s "https://api.github.com/repos/New9c/$pkgname/releases/latest" | grep -oP '"tag_name":\s*"\K(.*)(?=")')
pkgrel=1
pkgdesc="Shows your key presses, with a cute face!"
arch=("x86_64")
url="https://github.com/New9c/$pkgname"
license=('GPL3')
depends=('portaudio')
source=("$pkgname::https://github.com/New9c/$pkgname/releases/download/$pkgver/$pkgname")
sha256sums=("SKIP")

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
