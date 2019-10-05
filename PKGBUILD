# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>

pkgname=homematic-manager-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='Homematic Device Configuration and Administration'
arch=('x86_64')
url='https://github.com/hobbyquaker/homematic-manager'
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'xdg-utils' 'libxss' 'libsecret')
provides=('homematic-manager')
conflicts=('homematic-manager')
options=('!strip')
source=("https://github.com/hobbyquaker/homematic-manager/releases/download/${pkgver}/homematic-manager_${pkgver}_amd64.deb")
sha256sums=('33943f056c5a6b64c31d5d1bb0428c88ec5b46b921d4697dcccdcf19d44d3fab')

package() {
  # extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}
