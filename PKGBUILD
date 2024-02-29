# Maintainer: Sateallia <mail at sateallia dot org>

pkgname=cso-thumbnailer
pkgver=1.0.0
pkgrel=2
pkgdesc='A thumbnailer for "application/x-compressed-iso" MIME type PSP software files'
arch=('x86_64')
url='https://sateallia.org/software/'
license=('MIT')

source=('https://sateallia.org/code/cso-thumbnailer/cso-thumbnailer_1_0_0.tar.gz')

build() {
	make
}

package() {
    install -D -m644 "${srcdir}/cso.thumbnailer" "${pkgdir}/usr/share/thumbnailers/cso.thumbnailer"
    install -D -m755 "${srcdir}/cso-thumbnailer" "${pkgdir}/usr/local/bin/cso-thumbnailer"
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
md5sums=('aa6e5a9060c8b0a1bb168ec98be6948a')
