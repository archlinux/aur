# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: $pooky Hunter <spookyh+arch@gmail.org>

pkgname=rc-local
pkgver=1
pkgrel=1
pkgdesc="Support for legacy rc.local scripts"
url=("https://aur.archlinux.org/packages/rc-local/")
arch=('any')
license=('BSD')
depends=('bash')
source=(rc-local.service)
md5sums=('bb2cfecf3c6d99c6e6ee9eb58bcde75d')

package() {
	echo "#!/bin/bash" > rc.local
	install -D -m 0755 rc.local $pkgdir/etc/rc.local
	install -D -m 0644 rc-local.service $pkgdir/usr/lib/systemd/system/rc-local.service
}
