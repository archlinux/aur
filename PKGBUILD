# Maintainer: Ianis G. Vasilev <mail@ivasilev.net>

pkgname=wintoggle-git
pkgver=1.0
pkgrel=0
pkgdesc='A simple xdotool-based window state toggler'
arch=('any')
url='https://github.com/v--/wintoggle'
license=('BSL-1.0')
depends=('bash' 'xdotool')
makedepends=('git')
provides=('wintoggle')
conflicts=('wintoggle')
md5sums=('SKIP')
source='git://github.com/v--/wintoggle.git'

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/wintoggle/wintoggle" "$pkgdir/usr/bin/wintoggle"
}
