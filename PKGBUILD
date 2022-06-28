# Maintainer: melvyn2 <melvyn2 at brcok dot tk>
pkgname=plasma5-shader-wallpaper
pkgver=2.0.1alpha
pkgrel=2
pkgdesc="Plasma animated shader wallpaper plugin"
arch=(any)
url="https://github.com/y4my4my4m/kde-shader-wallpaper"
license=(GPL)
depends=(plasma-desktop)
source=("https://github.com/y4my4my4m/kde-shader-wallpaper/archive/refs/tags/v2.0.1-alpha.tar.gz")
sha256sums=('27ed68130890ab375d9ea43d932d424a0c92a7e3fc40f2492c3bd405168a72da')

package() {
    kdepkgdest="${pkgdir}/usr/share/plasma/wallpapers/online.knowmad.shaderwallpaper"
    mkdir -p "${kdepkgdest}"
    cp "${srcdir}/kde-shader-wallpaper-2.0.1-alpha/metadata.desktop" "${kdepkgdest}"
    cp -r "${srcdir}/kde-shader-wallpaper-2.0.1-alpha/contents" "${kdepkgdest}"
}
