# Maintainer: maoyaotang <292898660@qq.com>

pkgname=ttf-honorsans
_pkgname=honorsans
pkgver=2024.7.28
pkgrel=1
pkgdesc='华为HONORSans字体'
arch=('any')
url='https://www.huawei.com/cn/'
license=('custom')
depends=('git')
source=("git+https://gitee.com/mao-yaotang/honorsans.git")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/fonts/HONORSans"
  cp -r * "${pkgdir}/usr/share/fonts/HONORSans"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
