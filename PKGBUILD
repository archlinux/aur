# Maintainer:  <qqqqqqqqq9 AT web DOT de
# Contributor: Paul Barker <paul@paulbarker.me.uk>
pkgname=cwdiff
pkgver=0.4.0
pkgrel=1
pkgdesc="A colorized version of wdiff"
arch=( any )
url="https://code.google.com/p/cj-overlay/"
license=( GPL )
depends=(wdiff bash)
source=("https://github.com/junghans/cwdiff/archive/v$pkgver.tar.gz")
sha256sums=('01b4fcb372a28fed75e465fa3eb02c4b648ab17cd0e207cff5fd5718155ecd54')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 cwdiff.rc "${pkgdir}/etc/mercurial/hgrc.d/cwdiff.rc"
	install -D cwdiff "${pkgdir}/usr/bin/cwdiff"
}
