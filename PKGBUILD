# Maintainer: Victor Fernandez Rico <vfrico at gmail dot com>
# Helpers @kprkpr & @PedroHLC
pkgname=pimagizer
pkgver=0.4.5
pkgrel=3
pkgdesc="A Python program with GTK ui created to resize images"
arch=('any')
url="http://cambiadeso.es/proyectos/pimagizer"
license=('GPL3')
#groups=()
depends=('python' 'python-pillow' 'desktop-file-utils' 'pygobject-devel' 'python-gobject')
makedepends=('python-setuptools')
#backup=()
options=(!emptydirs)
source=(https://github.com/vfrico/pimagizer/archive/v$pkgver.tar.gz)
md5sums=(1cd841e648e767f3e7693550ba19586f)
sha256sums=(b5199dbae9a0490edcff580f00c3916532272dab7f278bbd37e429a163122578)
#source=(https://launchpad.net/$pkgname/trunk/0.4.2/+download/$pkgname-$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

