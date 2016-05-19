# Maintainer: wtx <sdrb@onet.eu>

pkgname=pccts
pkgver=1.33MR33
pkgrel=1
pkgdesc="PCCTS is the Purdue Compiler-Compiler Tool Set"
arch=('x86_64')
url="http://www.polhode.com/pccts.html"
license=('LGPL')
depends=('dpkg')
source=('http://archive.ubuntu.com/ubuntu/pool/universe/p/pccts/pccts_1.33MR33-6_amd64.deb')
sha1sums=('fe6c8efcf6b6ff7f787a15b9419899d2e92946d4')

prepare() {
	dpkg-deb -x ./pccts_1.33MR33-6_amd64.deb ${srcdir}
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}
}
