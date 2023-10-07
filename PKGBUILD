# Maintainer: hertg <aur@her.tg>
# This file is generated automatically via CI
pkgname=lightdm-theme-neon-bin
pkgver=0.2.2
pkgdesc='Modern and customizable theme for web-greeter with a nostalgic neon look, binary version'
pkgrel=1
arch=('any')
license=('GPL')
url='https://github.com/hertg/lightdm-neon'
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("lightdm-theme-neon-bin-0.2.2.tar.gz::https://github.com/hertg/lightdm-neon/releases/download/v0.2.2/build.tar.gz")
sha256sums=(d53cc196497c324d9268d94e0a2d78b8ead5203179e46194b7986402a0968034)

package() {
  cd ${srcdir}
  install -dm755 "${pkgdir}/usr/share/web-greeter/themes/neon"
  cp -r public/. "${pkgdir}/usr/share/web-greeter/themes/neon"
}
