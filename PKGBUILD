# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=(alibaba-puhuiti alibaba-sans)
pkgver=1.01
pkgrel=2
pkgdesc="Alibaba PuHuiTi fonts"
arch=('any')
license=('custom')
url="https://alibabafont.taobao.com"
depends=('fontconfig' 'xorg-font-utils')
source=("http://aifont.oss-cn-beijing.aliyuncs.com/Alibaba%20PuHuiTi/Alibaba%20PuHuiTi_AlibabaSans.zip")
sha512sums=('6e0119b1a4d50128bbe6dfbe38c13fc3490651aa706ff7b7773248bcb931bfad8fbb752b7883621fbcd53f757425e624b8f6d293fa1aac1685ead9bba03aca12')

package_alibaba-puhuiti() {
  cd '阿里巴巴普惠体（中西文完整版）'
  install -dm755 "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
  install -Dm644 阿里巴巴普惠体/*.otf "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
}

package_alibaba-sans() {
  pkgdesc="Alibaba Sans fonts"

  cd '阿里巴巴普惠体（中西文完整版）'
  install -dm755 "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
  install -Dm644 AlibabaSans/*/*.otf "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
}
