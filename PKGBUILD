pkgname=quelea-bin
pkgver=2016.1
pkgrel=2
pkgdesc="Free projection software for churches"
arch=('i686' 'x86_64')
url="http://www.quelea.com"
license=('EULA')
groups=('base-devel')
depends=(java-runtime)
optdepends=(vlc openoffice)
source=(https://sourceforge.net/projects/quelea/files/2016.1/quelea-2016.1-deb-install.deb)
md5sums=(cbfdb2b68db0d95cb8e59dfc093c6c4b)

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
