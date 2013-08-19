# Original Contributor: Archie <xMickael@ifrance.com>
# Maintainer : Anish Bhatt <anish[removethis][at]gatech[dot]edu>

pkgname=phatch
pkgver=0.2.7.1
pkgmajorv=0.2.7
pkgrel=6
pkgdesc="Phatch is a simple to use cross-platform GUI Photo Batch Processor."
depends=('python2' 'wxpython' 'python-imaging' 'mlocate')
optdepends=('python-nautilus' 'pyexiv2')
arch=('i686' 'x86_64')
license=('GPL')

source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz" )
	
url="http://photobatch.stani.be"
md5sums=('c0638bcc6510d340c03c40ddfb0a0c2f' )
install='phatch.install'

package() {
	pushd ${srcdir}/${pkgname}-${pkgmajorv}
	python2 setup.py install --root=${pkgdir}	
}
