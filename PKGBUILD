pkgname=quelea-bin
pkgver=2016.2
pkgrel=1
pkgdesc="Free projection software for churches"
arch=('i686' 'x86_64')
url="http://www.quelea.org"
license=('EULA')
groups=('base-devel')
depends=(java-runtime)
optdepends=(vlc openoffice)
source=(http://heanet.dl.sourceforge.net/project/quelea/2016.2%20Beta/quelea-2016.2-beta-deb-install.deb)
md5sums=(90672b9ab5a2651dbc5b732ec4bad923)

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
