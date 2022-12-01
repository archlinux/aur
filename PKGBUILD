pkgname="desktop-builder"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="create desktop file"
arch=("x86_64")
license=("custom")
source=("https://github.com/houxinlin/linux-desktop-builder.git")
sha512sums=("SKIP")
package(){

  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/desktop-builder" "${pkgdir}/usr/bin/desktop-builder"
  chmod +x "${pkgdir}/usr/bin/desktop-builder"

}
