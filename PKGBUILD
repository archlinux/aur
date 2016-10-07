pkgname=puush4linux
pkgdesc="puush4linux is a Linux client for the popular screenshot host puush. puush4linux aims to reach feature parity with the official Windows puush client. It currently supports authentication, taking screenshots and file uploading."
pkgver=r16
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/zekesonxx/puush4linux"
license=('Apache-2.0')
source=('git+https://github.com/zekesonxx/puush4linux.git')
md5sums=('SKIP')
depends=('bash' 'curl' 'xclip' 'libnotify' 'maim' 'slop' 'xdotool')
makedepends=('git')

package() {
	install -D $srcdir/puush4linux/puush $pkgdir/usr/bin/puush
}
