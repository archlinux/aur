pkgname=ht2000-bin
pkgver=1.2
pkgrel=1
pkgdesc="driver for HT2000 co2 meter(10c4:82cd)"
arch=("x86_64")
url="https://github.com/tomvanbraeckel/slab_ht2000"
license=("GPL")
source=("https://github.com/tomvanbraeckel/slab_${pkgname%-bin}/releases/download/v${pkgver}/slab_${pkgname%-bin}_v${pkgver}.zip")
sha512sums=("2a79826d65bc3283007f4cc760a0bf2f7d9f55d637f04877c65797d9453d70a408a4c5fc1936c7a962a538dd656700df8129595bff230227d3466e9e757c5220")

package() {
  install -Dm755 "slab_${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
