# Maintainer: kalter@deadsoftware.ru

pkgname=noticeditor-git
pkgver=1.1
pkgrel=1
pkgdesc="It is an utility to edit notices"
arch=('i686' 'x86_64')
url="https://github.com/TemporaryTeam/NoticEditor"
license="Apache 2.0"
depends=('jdk8-openjdk'
         'java-openjfx')
makedepends=('git'
             'jdk8-openjdk'
             'java-openjfx'
             'gradle')
source=("git+https://github.com/TemporaryTeam/NoticEditor")
md5sums=('SKIP')

build() {
	cd "${srcdir}/NoticEditor"
	make
}

package() {
	cd "${srcdir}/NoticEditor"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
