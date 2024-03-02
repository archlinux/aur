# Maintainer: A. Benz <hello@benz.dev>
pkgname=pww-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='utility wrapper around playerctl'
url='https://github.com/abenz1267/pww'
source_x86_64=("https://github.com/abenz1267/pww/releases/download/v$pkgver/pww_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/pww/releases/download/v$pkgver/pww_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('pww')
provides=('pww')
sha256sums_x86_64=('877f15c1c33e8148ee648cf89e434a18f6adcdb875c0b6f499f7044e15e720ab')
sha256sums_aarch64=('fdc98b6de47069a2cbd20e0bd16b2889e6a3e789f352e348f44e67649f7fd96e')

package() {
  cd "$srcdir/"

  install -Dm755 pww "${pkgdir}/usr/bin/pww"
}
