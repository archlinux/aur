# Maintainer: Paul Barker <paul@paulbarker.me.uk>
pkgname=cwdiff
pkgver=0.2.4
pkgrel=1
pkgdesc="A colorized version of wdiff"
arch=any
url="https://code.google.com/p/cj-overlay/"
license=GPL
depends=(wdiff bash)
optdepends='a2ps: Produce PostScript output'
source="https://cj-overlay.googlecode.com/files/cwdiff-0.2.4.tar.gz"
sha256sums="85f9e64e832ef5d0593389111f3931e2f36ceb1bb8c71a76bfa8f9eb66f847a1"

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 hgrc.d/cwdiff.rc "${pkgdir}/etc/mercurial/hgrc.d/cwdiff.rc"
	install -D cwdiff "${pkgdir}/usr/bin/cwdiff"
}
