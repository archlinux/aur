# Maintainer: Roman Vasilev <2rvasilev@live.ru>


pkgname=libdeep_filter_ladspa
pkgver=0.5.1
pkgrel=2
pkgdesc='A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using on Deep Filtering (LASPDA)'
arch=(x86_64)
url='https://github.com/Rikorose/DeepFilterNet'
license=(MIT)
install=$pkgname.install
# depends=
# makedepends=(cmake libx11 libxrandr libxinerama libxcursor)
source=($pkgname.so::$url/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.so)
sha256sums=('b8375764dcf199553500f32306ce934e11c99c26c48265a5d9abd7cd888c242a')


# build() {
#   # cmake -B build -S $pkgname-$pkgver \
#   #   -DCMAKE_INSTALL_PREFIX=/usr \
#   #   -DCMAKE_BUILD_TYPE=None
#   # cmake --build build
# }

package() {
  # DESTDIR="$pkgdir" cmake --install build
  mkdir -p $pkgdir/usr/lib/ladspa/
  install $pkgname.so $pkgdir/usr/lib/ladspa/
}

#post_install() {
#  echo -e "\n*** Refer to [https://github.com/Rikorose/DeepFilterNet/tree/main/ladspa] for help ***\n"
#}
