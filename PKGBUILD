# Maintainer: Roman Vasilev <2rvasilev@live.ru>


pkgname=libdeep_filter_ladspa
pkgver=0.5.3
pkgrel=1
pkgdesc='A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using on Deep Filtering (LASPDA)'
arch=(x86_64)
url='https://github.com/Rikorose/DeepFilterNet'
license=(MIT)
install=$pkgname.install
# depends=
# makedepends=(cmake libx11 libxrandr libxinerama libxcursor)
source=($pkgname.so::$url/releases/download/v$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.so)
sha256sums=('b6b153e2b5e93ef1931d2fb2afecdfb20d7fe5a96dbd67c1120930cc17c54d22')


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
