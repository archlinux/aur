# $Id: PKGBUILD 18639 2010-06-10 11:06:23Z ibiru $
# Maintainer: Biru Ionut <biru.ionut at gmail.com>
pkgname=microblog-purple2
pkgver=0.4.1.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Libpurple plug-in supporting microblog services like Twitter.'
url='https://github.com/fr0nk/microblog-purple2'
license=('GPL3')
depends=('pidgin' 'json-glib')
conflicts=('microblog-purple')
source=(https://github.com/fr0nk/microblog-purple2/archive/v${pkgver}.tar.gz)
sha512sums=('2528bf89cf4c3f026be4eb12ba0752f90fef5f4bed49496149a1110ee8729b7899939e0589773f512029720834261cd5d04915a028201acd5a0ca7dfbb189d11')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
