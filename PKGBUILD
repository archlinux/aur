# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Pável Varela Rodríguez [NeOnsKuLL] <neonskull@gmail.com>

pkgname=pybgsetter
pkgver=0.5
pkgrel=3

pkgdesc="Multi-backend (hsetroot, Esetroot, habak, feh) User Friendly GUI/CLI tool to set desktop wallpaper"
url="http://bbs.archlinux.org/viewtopic.php?id=88997"
arch=('any')
license=('GPL')

depends=('python2' 'pygtk' 'imagemagick')
optdepends=('hsetroot: to activate support for Hsetroot'
	    'esetroot: to activate support for Esetroot'
	    'habak: to activate support for Habak'
	    'feh: to activate support for Feh')
source=($pkgname-$pkgver.tar.bz2)
sha256sums=('7b430784ce0e7f3d7508ac2bcba2b422252270de82c913294628bb4c110cbc4b'
            'ce72846ec5d40061736ebc977bedeef8002c0504bb08efe3b85b127c13b951da')
install=pybgsetter.install

package() {
    $pkgname-$pkgver/install.sh "$pkgdir"/
}
