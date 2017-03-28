#Maintainer: Jose Moruno <sniferl4bs@gmail.com>
pkgname="mpis"
pkgver="2.0.1"
pkgrel="2.0"
pkgdesc="Script allows to configure the system, install some applications for a regular work day thinked in developers, 
gamers,and more."
arch=('i686' 'x86_64')
url="https://kernelpanicblog.wordpress.com"
license=("GPLv3")
depends=("python3")
makedepends=("python-setuptools")
options=(!emptydirs)
source=("https://github.com/KernelPanicBlog/MPIS/archive/${pkgver}.tar.gz")
md5sums=("1bd0ec36faaa799fe7d3e926fff32941")

package() {
  cd "$srcdir/MPIS-${pkgver}"
  python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
