# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=phoneflashtoollite
pkgver=5.2.4.0
pkgrel=1
pkgdesc='Flashes firmware and OS images onto Intel-based devices'
arch=('x86_64')
url='https://01.org/android-ia/downloads/intel-phone-flash-tool-lite'
license=('custom')

source=(
  "https://download.01.org/android-ia/tools/phoneflashtool-lite/5.2.4.0/${pkgname}_${pkgver}_linux_x86_64.deb"
  'LICENSE'
)

md5sums=(
  '916b6bb55c6f2da57a4c2c0ecedf1c40'
  '328abc7b7f3fd84dffb3ff5780a2ccd3'
)

package() {
  cd "${srcdir}"

  tar xvf data.tar.gz
  cp -r "${srcdir}/usr" "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
