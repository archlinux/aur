# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-cpu-governor
pkgdesc="Python module for py3status to keep track of your cpu governor state"
<<<<<<< Updated upstream
pkgver=0.1.4
||||||| Stash base
pkgver=0.1.3
=======
pkgver=0.1.5
>>>>>>> Stashed changes
pkgrel=1
arch=('any')
license=('MIT')
<<<<<<< Updated upstream
depends=('python' 'py3status' 'python-build' 'python-installer' 'python-poetry')
makedepends=('python-setuptools')
||||||| Stash base
depends=('python' 'py3status')
makedepends=('python-setuptools')
=======
depends=('python' 'py3status')
makedepends=('python-setuptools' 'python-poetry' 'python-build' 'python-installer')
>>>>>>> Stashed changes
url="https://github.com/mcgillij/py3status-cpu-governor"
<<<<<<< Updated upstream
source=("https://github.com/mcgillij/py3status-cpu-governor/releases/download/$pkgver/py3status_cpu_governor-$pkgver.tar.gz")
md5sums=('05020e5d4e0baaf5429c0592bd4f5353')
||||||| Stash base
source=("https://github.com/mcgillij/py3status-cpu-governor/releases/download/0.1.3/py3status-cpu-governor-0.1.3.tar.gz")
md5sums=('fdc2c5fcb4cdab7ae205a1b857c9efb2')
=======
source=("https://github.com/mcgillij/py3status-cpu-governor/releases/download/$pkgver/py3status_cpu_governor-$pkgver.tar.gz")
#source=("py3status_cpu_governor-$pkgver.tar.gz")
md5sums=('692328e5952dc92fe39db3a85d6388c1')
>>>>>>> Stashed changes

build() {
  cd "$srcdir/py3status_cpu_governor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status_cpu_governor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 
