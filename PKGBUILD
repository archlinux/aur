# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=csvtk
pkgver=0.10.0
pkgrel=1
pkgdesc="A cross-platform, efficient and practical CSV/TSV toolkit in Golang"
arch=('x86_64')
url="http://bioinf.shenwei.me/csvtk"
license=('MIT')
depends=('')
provides=('csvtk')
conflicts=('csvtk')
source=("https://github.com/shenwei356/csvtk/releases/download/v${pkgver}/${pkgname}_linux_amd64.tar.gz")
md5sums=('0ff4722e03a41a18ead601790e09d0d4')

package() {
  cd "${srcdir}/"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
