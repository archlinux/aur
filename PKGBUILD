# Maintainer: QiE2035 <qie2035@users.noreply.github.com>

pkgname=dwproton-binfmt
pkgver=1
pkgrel=1
pkgdesc='让内核把 PE 可执行文件交给 dwproton 启动（binfmt_misc 注册，重启后依然有效）'
arch=('any')
url='https://dawn.wine/dawn-winery/dwproton'
license=('MIT')
depends=('dwproton-launcher')
conflicts=('wine')
install="$pkgname.install"
source=('dwproton.conf')
sha256sums=('190b128407ab9fdb10caf753df36330a5f05781d3dd5a71e8f34d780df829317')

package() {
  install -Dm644 dwproton.conf "$pkgdir/usr/lib/binfmt.d/dwproton.conf"
}
