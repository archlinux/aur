#Maintainer: Jose Moruno <sniferl4bs@gmail.com>
pkgname="mpis"
pkgver="0.2a"
pkgrel="1.1"
pkgdesc="Script allows to configure the system, install some applications for a regular work day thinked in developers, 
gamers,and more."
arch=('i686' 'x86_64')
url="https://kernelpanicblog.wordpress.com"
license=("GPLv3")
depends=("python3")
makedepends=("python-setuptools")
options=(!emptydirs)
source=("https://github.com/KernelPanicBlog/MPIS/archive/${pkgver}.tar.gz")
md5sums=("24fe3d1681275e4e833e3e0ef5b34a5d")

package() {
  cd "$srcdir/MPIS-${pkgver}"
  python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
