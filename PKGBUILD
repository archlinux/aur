pkgname=lv2vst
pkgver=git
pkgrel=1
pkgdesc="experimental LV2 to VST2.x wrapper"
arch=('x86_64')
license=('GPL2')
url="https://github.com/x42/lv2vst"
depends=('glibc')
makedepends=('git' 'gcc' 'make' 'lv2' 'steinberg-vst36')
source=("git+https://github.com/x42/lv2vst.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/lv2vst"
  make
}

package() {
  install -D -m755 "${srcdir}/lv2vst/lv2vst.so" "${pkgdir}/usr/lib/vst/lv2vst.so"
}
                                                                                                                                                                                                                            
