#Contributor: Jarred Leonardo <jarredleonardo at googlemail dot com>
#Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=xcursor-double3d
pkgver=1.0
pkgrel=2
pkgdesc="Double3D cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Double3D?content=106574"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106574-Double3D.tar.gz")
md5sums=('f3c9a33889aa873aed4d829fb10fae0c')

build() {
	cd $startdir/src/Double3D
	install -d -m755 $startdir/pkg/usr/share/icons/double3d/cursors
	cd $startdir/src/Double3D/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/double3d/cursors
	done
}