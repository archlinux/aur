# Contributor:  <qqqqqqqqq9 AT web DOT de
# Contributor: Paul Barker <paul@paulbarker.me.uk>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cwdiff
pkgver=0.4.0
pkgrel=2
pkgdesc="A wrapper for wdiff to provide colorized output"
arch=('any')
url="https://github.com/junghans/cwdiff.git"
license=('GPL')
depends=('wdiff' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/junghans/cwdiff/archive/v$pkgver.tar.gz")
sha256sums=('01b4fcb372a28fed75e465fa3eb02c4b648ab17cd0e207cff5fd5718155ecd54')

package() {
	cd ${pkgname}-${pkgver}
	install -Dm644 cwdiff.rc "$pkgdir"/etc/mercurial/hgrc.d/cwdiff.rc
	install -D cwdiff "$pkgdir"/usr/bin/cwdiff
}
