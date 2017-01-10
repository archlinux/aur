# Contributor: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=sendxmpp-py
pkgver=1.0
pkgrel=1
pkgdesc='sendxmpp is the XMPP equivalent of sendmail. It is an alternative to the old sendxmpp written in Perl.'
arch=('any')
license=('GPL3')
depends=('python-dnspython' 'python-sleekxmpp' 'python')
provides=('sendxmpp')
conflicts=('sendxmpp')
url="https://github.com/moparisthebest/sendxmpp-py"
source=("https://codeload.github.com/moparisthebest/sendxmpp-py/tar.gz/v$pkgver")
sha256sums=('50fa7fdb38291aa2d49e330f4fb627ae1bb671572fbc1682b8b82593d34c45e2')

package() {
	cd "sendxmpp-py-$pkgver"
	install -D -m755 sendxmpp     "${pkgdir}"/usr/bin/sendxmpp
	install -D -m755 sendxmpp.cfg "${pkgdir}"/etc/sendxmpp/sendxmpp.cfg
}
