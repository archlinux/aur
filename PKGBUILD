# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libcurl-gnutls.so'
pkgver='7.85.0'
pkgrel=1
pkgdesc='Unversioned soname for libcurl-gnutls'
arch=('any')
url='https://curl.haxx.se'
license=('MIT')
depends=('libcurl-gnutls')
provides=('libcurl-gnutls.so')

package() {
	install -dm 0755 "${pkgdir}/usr/lib/"
	ln -s libcurl-gnutls.so.4.8.0 "${pkgdir}/usr/lib/libcurl-gnutls.so"
}

