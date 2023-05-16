# Maintainer: beltsmith <aur@alexgirdler.com>
pkgname='terraform-variables-generator'
pkgver=0.0.2
pkgrel=1
pkgdesc="Simple Tool to Generate Variables file from Terraform Configuration"
arch=('x86_64')
url="https://github.com/alexandrst88/terraform-variables-generator"
license=('unknown')

conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")

source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('45f1b37d25599c1c004b6c9646d13309872034e62604ff09c392552be6d0d23e')

package() {
  install -Dm 755 terraform-variables-generator "$pkgdir/usr/bin/terraform-variables-generator"
}
