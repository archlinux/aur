# Maintainer: xihale <xihale.top@qq.com>

pkgname=ttf-firacode
pkgver=6.2
pkgrel=2
pkgdesc="Free monospaced font with programming ligatures"
arch=('any')
url="https://github.com/tonsky/FiraCode"
license=('OFL-1.1')
source=("https://github.com/tonsky/FiraCode/releases/download/${pkgver}/Fira_Code_v${pkgver}.zip")
sha256sums=('0949915ba8eb24d89fd93d10a7ff623f42830d7c5ffc3ecbf960e4ecad3e3e79')

package() {

  install -d ${pkgdir}/usr/share/fonts/FiraCode
  cp ttf/*.ttf ${pkgdir}/usr/share/fonts/FiraCode

}
