# Maintainer: Roman Vasilev <2rvasilev@live.ru>


pkgname=libdeep_filter_ladspa
pkgver=0.4.0
pkgrel=1
pkgdesc='A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using on Deep Filtering (LASPDA)'
arch=(x86_64)
url='https://github.com/Rikorose/DeepFilterNet'
license=(MIT)
# depends=
# makedepends=(cmake libx11 libxrandr libxinerama libxcursor)
source=($pkgname.so::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.so)
sha256sums=('28ea96bd568de4e181170446d3a03f80bde644f7ac3b2a327a5d260ae9a419a3')

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
