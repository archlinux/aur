# Maintainer: 堡塔 Technology Co., Ltd. <hwl@bt.cn>
# Contributor: mineleng <15119587808@163.com>
pkgname=bt-client-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="堡塔多机管理"
arch=('x86_64')
url="https://www.bt.cn"
license=('Apache')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux'
  'libsecret'
  'binutils'
)
optdepends=('libappindicator-gtk3: systray indicator support')

source=("bt-client-${pkgver}.deb::https://download-esa.bt.cn/bt-client/bt-client-linux-${pkgver}-amd64.deb")
sha256sums=('ddba7b1f6b364af450f3984dd89b3eaa3ee383d980994632dc60e438081e0f96')

package() {
  cd "$srcdir"
  ar x "bt-client-${pkgver}.deb"
  tar -xf data.tar.xz -C "$pkgdir"
}

