# Maintainer: hertg <aur@her.tg>
# This file is generated automatically via CI
pkgname=lightdm-theme-neon-bin
pkgver=0.2.1
pkgdesc='Modern and customizable theme for web-greeter with a nostalgic neon look, binary version'
pkgrel=1
arch=('any')
license=('GPL')
url='https://github.com/hertg/lightdm-neon'
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("lightdm-theme-neon-bin-0.2.1.tar.gz::https://github.com/hertg/lightdm-neon/releases/download/v0.2.1/build.tar.gz")
sha256sums=(7b8acbb1e558ed5de9d6ce59d49995399ec6f6c7a702031f88f5096e5793a815)

package() {
  cd ${srcdir}
  install -dm755 "${pkgdir}/usr/share/web-greeter/themes/neon"
  cp -r public/. "${pkgdir}/usr/share/web-greeter/themes/neon"
}
