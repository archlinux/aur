# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

pkgname=sidenote-bin
pkgver=0.1.1
pkgrel=1

pkgdesc='A command line utility for managing plain text notes.'
arch=('x86_64')
url='https://github.com/ryot4/sidenote'
license=('MIT')
source=("$pkgname-$pkgver.tgz::https://github.com/ryot4/sidenote/releases/download/v${pkgver}/sidenote_v${pkgver}_linux_amd64.tar.gz")

package() {
	cd "$srcdir"
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m755 "${srcdir}/sidenote" "${pkgdir}/usr/bin/sidenote"
}

md5sums=('2d86ef296001727c1352ecc44331dba2')
