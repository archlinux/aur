# Maintainer: Roman Vasilev <2rvasilev@live.ru>


pkgname=libdeep_filter_ladspa-bin
pkgver=0.5.6
pkgrel=1
pkgdesc='A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using on Deep Filtering (LASPDA)'
arch=(x86_64)
url='https://github.com/Rikorose/DeepFilterNet'
license=(MIT)
install=libdeep_filter_ladspa.install
# depends=
# makedepends=(cmake libx11 libxrandr libxinerama libxcursor)
source=($pkgname-$pkgver.so::$url/releases/download/v$pkgver/libdeep_filter_ladspa-$pkgver-x86_64-unknown-linux-gnu.so)
sha256sums=('2ca3205c2911d389604a826a240e745597d50252b5cab81c8248252b335e2236')
provides=(libdeep_filter_ladspa)

# build() {
#   # cmake -B build -S $pkgname-$pkgver \
#   #   -DCMAKE_INSTALL_PREFIX=/usr \
#   #   -DCMAKE_BUILD_TYPE=None
#   # cmake --build build
# }

package() {
  # DESTDIR="$pkgdir" cmake --install build
  mkdir -p $pkgdir/usr/lib/ladspa/
  install $pkgname-$pkgver.so $pkgdir/usr/lib/ladspa/libdeep_filter_ladspa.so
}

#post_install() {
#  echo -e "\n*** Refer to [https://github.com/Rikorose/DeepFilterNet/tree/main/ladspa] for help ***\n"
#}
