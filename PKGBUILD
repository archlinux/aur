#Maintainer: Jose Moruno <sniferl4bs@gmail.com>
pkgname="mpis"
pkgver="0.2a"
pkgrel="1"
pkgdesc="Script allows to configure the system, install some applications for a regular work day thinked in developers, 
gamers,and more."
arch=('i686' 'x86_64')
url="https://kernelpanicblog.wordpress.com"
license=("GPLv3")
depends=("python3")
makedepends=("python-setuptools")
options=(!emptydirs)
source=("git+https://github.com/KernelPanicBlog/MPIS.git#branch=master")
md5sums=("SKIP")

package() {
  cd "$srcdir/MPIS"
  python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
