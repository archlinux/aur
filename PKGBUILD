# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: zhangjoto
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

pkgname=libkeepalive
pkgver=0.2
pkgrel=3
pkgdesc='Enable tcp keepalive features without change in the original program'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/libkeepalive/'
license='GPL'
source=('http://jaist.dl.sourceforge.net/project/libkeepalive/libkeepalive/0.2/libkeepalive-0.2.tar.gz')
md5sums=('cba031d7855efece5616fb8492c4e868')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -D -m0755 libkeepalive.so ${pkgdir}/usr/lib/libkeepalive.so
}
