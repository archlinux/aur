# Maintainer: hertg <aur@her.tg>
# This file is generated automatically via CI
pkgname=lightdm-theme-neon-bin
pkgver=0.2.3
pkgdesc='Modern and customizable theme for web-greeter with a nostalgic neon look, binary version'
pkgrel=1
arch=('any')
license=('GPL')
url='https://github.com/hertg/lightdm-neon'
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("lightdm-theme-neon-bin-0.2.3.tar.gz::https://github.com/hertg/lightdm-neon/releases/download/v0.2.3/build.tar.gz")
sha256sums=(1c3a34a06abb7e77c372a14759d924e51afd4cfed9fd699f9bc482e810594cd6)

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/web-greeter/themes/neon"
  cp -r public/. "${pkgdir}/usr/share/web-greeter/themes/neon"
}
