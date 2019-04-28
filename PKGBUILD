# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=(alibaba-puhuiti alibaba-sans)
pkgver=1.00
pkgrel=1
pkgdesc="Alibaba PuHuiTi fonts"
arch=('any')
license=('custom')
url="https://alibabafont.taobao.com"
depends=('fontconfig' 'xorg-font-utils')
source=("http://aifont.oss-cn-beijing.aliyuncs.com/Alibaba%20PuHuiTi/Alibaba%20PuHuiTi_AlibabaSans.zip")
sha512sums=('70da6a8c14c3c6ae42341828c9f7fe1c4fc1325256190092363c41b3d57502a653dc236b2f560bf8064490bc19b298494ceb878a02eda22d195079630b069f98')

package_alibaba-puhuiti() {
  install -dm755 "$pkgdir"/usr/share/fonts/alibaba/$pkgname/
  install -Dm644 "$srcdir"/阿里巴巴普惠体\ +\ AlibabaSans/阿里巴巴普惠体/* "$pkgdir"/usr/share/fonts/alibaba/$pkgname/
}

package_alibaba-sans() {
  pkgver=1.01
  pkgdesc="Alibaba Sans fonts"

  install -dm755 "$pkgdir"/usr/share/fonts/alibaba/$pkgname/
  install -Dm644 "$srcdir"/阿里巴巴普惠体\ +\ AlibabaSans/AlibabaSans/AlibabaSans\ Nornal/* "$pkgdir"/usr/share/fonts/alibaba/$pkgname/
  install -Dm644 "$srcdir"/阿里巴巴普惠体\ +\ AlibabaSans/AlibabaSans/AlibabaSans\ Nornal\ ltalics/* "$pkgdir"/usr/share/fonts/alibaba/$pkgname/
}
