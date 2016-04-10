# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cotire
pkgver=1.7.8
pkgrel=1
pkgdesc='CMake module to speed up builds. By fully automating techniques like precompiled header usage and single compilation unit builds for C and C++'
arch=(any)
license=('custom')
conflicts=('cmake<3.5' 'cmake>=3.6') # the Modules dir changes every major release
url='https://github.com/sakra/cotire'
source=("https://github.com/sakra/cotire/archive/$pkgname-$pkgver.tar.gz")
md5sums=('c5d41296dd179e390dc368686c8ccfdf')

package() {
  cd "$pkgname-$pkgname-$pkgver"

  modules_dir="$pkgdir/usr/share/cmake-3.5/Modules/"
  mkdir -p $modules_dir
  cp CMake/cotire.cmake $modules_dir

  license_dir="$pkgdir/usr/share/licenses/cotire/"
  mkdir -p $license_dir
  cp license $license_dir
}
