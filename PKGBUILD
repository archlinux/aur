# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=convox
pkgver=latest
pkgrel=1
pkgdesc="An open source PAAS that runs in your own AWS account."
arch=("any")
url="https://convox.com"
license=("Apache")
source=("https://install.convox.com/linux.zip")
md5sums=(SKIP)

package() {
  install -Dm755 convox "$pkgdir/usr/bin/convox"
}