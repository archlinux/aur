# Maintainer: Frank Zimmermann <veltheimer_frank (a) t-online.de>

pkgname=keyring
_pkgname=keyring
pkgver=20200517
pkgrel=1
pkgdesc="gnome-keyring python script + plugins for various apps (irssi,
vimperator, qutebroswer, msmtp and offlineimap"
arch=('any')
url="https://github.com/ervandew/keyring"
license=('unknown')
depends=('python' 'gnome-keyring')
makedepends=('git')
source=(git+https://github.com/ervandew/keyring.git)

md5sums=('SKIP')

package() {
	install -Dm755 "$srcdir/keyring/bin/keyring" "/usr/bin/"
	install -Dm755 "$srcdir/keyring/irrsi/scripts/keyring.plr"
	"/usr/share/irrsi/scripts/"
	install -Dm755 "$srcdir/Keyring/qutebrowser/userscripts/keyring"
	"usr/share/qutebrowser/userscripts/"
}	
