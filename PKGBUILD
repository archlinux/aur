# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=simple-ccsm
pkgver=0.8.12
pkgrel=1
pkgdesc="Simple Compizconfig Settings Manager"
arch=('any')
url="http://www.compiz-fusion.org/"
license=('GPL')
depends=('python'
	'pygobject-devel')
makedepends=('intltool')
source=("https://github.com/compiz-reloaded/simple-ccsm/releases/download/v${pkgver}/simple-ccsm-${pkgver}.tar.xz")
install=simple-ccsm.install
md5sums=('30b9e34ba326242b7a32590acf960523')

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 ./setup.py install --prefix=/usr --root="${pkgdir}"
}
