# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cacert-csr
pkgver=0.1
pkgrel=2
pkgdesc='CAcert Certificate Signing Request Generator'
arch=('any')
url='https://wiki.cacert.org/CSRGenerator'
depends=('openssl')
license=('MIT')
source=("${pkgname}-${pkgver}::http://svn.cacert.org/CAcert/Software/CSRGenerator/csr")
sha256sums=('4b17e7cb6bc53cc704f1c3877f5eb0fd7df0f639f930d2013f018a00eeca191f')

package() {
	install -D -m0755 ${pkgname}-${pkgver} "${pkgdir}"/usr/bin/csr
}

