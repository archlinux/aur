# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=simple-ccsm
pkgver=0.8.8
pkgrel=2
pkgdesc="Simple Compizconfig Settings Manager"
arch=('any')
url="http://www.compiz-fusion.org/"
license=('GPL')
depends=('ccsm>=0.8.4'
	'python'
	'pygtk>=2.10')
makedepends=('intltool')
optdepends=('compiz-fusion-kde: Compiz Fusion for KDE'
            'compiz-fusion-gtk: Compiz Fusion for GTK/GNOME')
source=("http://releases.compiz.org/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
install=simple-ccsm.install
md5sums=('79ca7285fac8bf722f154c67bee1204f')

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 ./setup.py install --prefix=/usr --root="${pkgdir}"
}
