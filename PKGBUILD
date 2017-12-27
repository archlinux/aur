# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=simple-ccsm
pkgver=0.8.14.1
pkgrel=1
pkgdesc="Simple Compizconfig Settings Manager"
arch=('any')
url="http://www.compiz-fusion.org/"
license=('GPL')
depends=('python'
	'pygobject-devel')
makedepends=('intltool')
source=("https://github.com/compiz-reloaded/simple-ccsm/releases/download/v${pkgver}/simple-ccsm-${pkgver}.tar.xz")
md5sums=('9943157db0527925b249a2efd4211a2d')

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 ./setup.py install --prefix=/usr --root="${pkgdir}"
}
