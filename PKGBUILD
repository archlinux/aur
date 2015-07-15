# Contributor : giacomogiorgianni@gmail.com

pkgname=blender26-ogre-exporter
_name=blender2ogre
pkgver=0.6.0
pkgrel=1
pkgdesc="Blender-integrated exporter for exporting OGRE meshes"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/wiki/index.php/OGRE_Meshes_Exporter"
depends=('python' 'blender' 'ogre')
license=('GPL')
install=blender-ogre-exporter.install
source=("http://blender2ogre.googlecode.com/files/$_name-$pkgver.zip")
#source=("https://code.google.com/p/blender2ogre/downloads/detail?name=$_name-$pkgver.zip")
md5sums=('72340d0d510e63427dfe980de4eb2a3d')

build() {
	mkdir -p ${pkgdir}/usr/share/blender/2.72/scripts/addons/
	cp -r ${srcdir}/io_export_ogreDotScene.py ${pkgdir}/usr/share/blender/2.72/scripts/addons/
}

