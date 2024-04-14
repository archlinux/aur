# Maintainer: hertg <aur@her.tg>
# This file is generated automatically via CI
pkgname=lightdm-theme-neon-bin
pkgver=0.2.4
pkgdesc='Modern and customizable theme for web-greeter with a nostalgic neon look, binary version'
pkgrel=1
arch=('any')
license=('GPL')
url='https://github.com/hertg/lightdm-neon'
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("lightdm-theme-neon-bin-0.2.4.tar.gz::https://github.com/hertg/lightdm-neon/releases/download/v0.2.4/build.tar.gz")
sha256sums=(a9379a21161472ba1e47ad7c4d6bb7c0fff50cc382ac1a5940c56f7d73a41080)

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/web-greeter/themes/neon"
  cp -r public/. "${pkgdir}/usr/share/web-greeter/themes/neon"
}
