# Maintainer: New9c <aimccccccccc@gmail.com>
pkgname='okey-git'
pkgver=$(curl -s "https://api.github.com/repos/New9c/OKey/releases/latest" | grep -oP '"tag_name":\s*"\K(.*)(?=")')
pkgrel=3
pkgdesc="Shows your key presses, with a cute face!"
arch=("x86_64")
url="https://github.com/New9c/OKey"
license=('GPL3')
depends=('portaudio')
source=("OKey::https://github.com/New9c/OKey/releases/download/$pkgver/OKey")
sha256sums=("SKIP")

package() {
	install -Dm755 "$srcdir/OKey" "$pkgdir/usr/bin/OKey"
}
