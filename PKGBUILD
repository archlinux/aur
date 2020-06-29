# Maintainer: koraynilay <koray.fra@gmail.com>
pkgname=scrnsvr-bin
pkgver=0.3
pkgrel=7
pkgdesc="Yet Another X Screensaver/locker. Precompiled version."
arch=('x86_64')
url="https://github.com/koraynilay/scrnsvr"
license=('WTFPL')
conflicts=('scrnsvr')
depends=('pulseaudio' 'grep' 'procps-ng' 'libxss')
makedepends=('git' 'gcc')
source=("$pkgname-$pkgver::git+https://github.com/koraynilay/scrnsvr")
optdepends=('dunst: dunstify for notifications' 'libnotify: for notifications')
md5sums=("SKIP")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 scrnsvr "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/scrnsvr/LICENSE"
}
