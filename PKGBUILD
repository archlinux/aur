# Maintainer: DaniD3v <nichtdu.login@gmail.com>

pkgname="jelly-drift-bin"
pkgdesc="Free racing game made by the youtuber Dani"
url="https://danidev.itch.io/jelly-drift"

pkgver="1.0.0"
pkgrel=8

license=("unknown")

source=("jelly-drift.desktop" "https://raw.githubusercontent.com/DaniD3v/jelly-drift-bin-aur-package/main/JellyDrift.tar.xz")
arch=("x86_64")

sha256sums=('56279e3d77e2126a5886856923005d965c20b57d792142606badb71744423ab2' 'df92c9317470e73f934628c61643ba53f05a3bd7441e55a9f61f117f502d08dd')

package() {
  mkdir -p "${pkgdir}/usr/share/applications"

  cp -R "${srcdir}/JellyDrift" "${pkgdir}/usr/share"
  cp "${srcdir}/jelly-drift.desktop" "${pkgdir}/usr/share/applications"
}
