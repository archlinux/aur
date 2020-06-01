# Maintainer: Frank Zimmermann <veltheimer_frank (a) t-online.de>

pkgname=keyring
_pkgname=keyring
pkgver=20200517
pkgrel=2
pkgdesc="gnome-keyring python script + plugins for various apps
(vimperator, qutebroswer, msmtp and offlineimap)"
arch=('any')
url="https://github.com/ervandew/keyring"
license=('unknown')
depends=('python' 'gnome-keyring')
makedepends=('git')
source=(git+https://github.com/ervandew/keyring.git)

md5sums=('SKIP')

package() {
	install -Dm755 "$srcdir/keyring/bin/keyring" "${pkgdir}/usr/local/bin/keyring"
	install -Dm755 "$srcdir/keyring/irssi/scripts/keyring.pl" "${pkgdir}/usr/share/irssi/scripts/keyring.pl"
	install -Dm755 "$srcdir/keyring/qutebrowser/userscripts/keyring" "${pkgdir}/usr/share/qutebrowser/userscripts/keyring"
	install -Dm644 "$srcdir/keyring/README.rst" "/${pkgdir}/usr/share/doc/keyring/README.rst"
}	
