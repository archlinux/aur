#Maintainer: Thomas Michelot <th0m4sm at gmail dot com>
pkgname=jcpwm
pkgver=1.7.125
pkgrel=15772
pkgdesc="JumpCloud Password Manager"
arch=(x86_64)
url="https://jumpcloud.com"
license=("custom")
options=(!strip)
install=jcpwm.install
source=("https://cdn.pwm.jumpcloud.com/DA/release/JumpCloud-Password-Manager-latest.deb")
sha256sums=('b82728e0abe6b73bf16423801afdb4b2c52e17290739a9079a17cdfd7df45b1d')

package() {
  depends=(
  'alsa-lib'
  'at-spi2-core'
  'desktop-file-utils'
  'gtk3'
  'libappindicator-gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nspr'
  'nss'
  'shared-mime-info'
  'util-linux-libs'
  'xdg-utils')
  
  bsdtar -xf "${srcdir}/data.tar.xz" -C "$pkgdir/"
}
