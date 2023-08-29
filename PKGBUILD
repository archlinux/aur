# Maintainer: Roman Vasilev <2rvasilev@live.ru>


pkgname=libdeep_filter_ladspa
pkgver=0.5.4
pkgrel=1
pkgdesc='A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using on Deep Filtering (LASPDA)'
arch=(x86_64)
url='https://github.com/Rikorose/DeepFilterNet'
license=(MIT)
install=$pkgname.install
# depends=
# makedepends=(cmake libx11 libxrandr libxinerama libxcursor)
source=($pkgname-$pkgver.so::$url/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.so)
sha256sums=('98de157bbd3a7dd8ff1e5df4ca2e273e795521a4c70253c2b249268aae43df58')


# build() {
#   # cmake -B build -S $pkgname-$pkgver \
#   #   -DCMAKE_INSTALL_PREFIX=/usr \
#   #   -DCMAKE_BUILD_TYPE=None
#   # cmake --build build
# }

package() {
  # DESTDIR="$pkgdir" cmake --install build
  mkdir -p $pkgdir/usr/lib/ladspa/
  install $pkgname-$pkgver.so $pkgdir/usr/lib/ladspa/$pkgname.so
}

#post_install() {
#  echo -e "\n*** Refer to [https://github.com/Rikorose/DeepFilterNet/tree/main/ladspa] for help ***\n"
#}
