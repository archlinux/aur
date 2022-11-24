# Maintainer: ItzSelenux <itszariep@outlook.com>

pkgname=picom-9-bin
pkgver=9
pkgrel=1
pkgdesc='X compositor that may fix tearing issues (v9 bin for old hardware)'
arch=('x86_64')
url='https://github.com/yshui/picom'
license=(MIT MPL)
depends=(hicolor-icon-theme libconfig libdbus libev libgl pcre pixman
         xcb-util-image xcb-util-renderutil)
provides=('picom')
source=("https://archive.archlinux.org/packages/p/picom/picom-9.1-3-x86_64.pkg.tar.zst")
sha256sums=('56e7195d515febcec623f0acf6d70de91a6e00711ff8bc4efe5832eb43d30ef0')

package() {
  tar -xvf "picom-9.1-3-x86_64.pkg.tar.zst"
  cp -r usr "${pkgdir}"
  cp -r etc "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} \;
}

