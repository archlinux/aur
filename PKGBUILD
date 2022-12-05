# Maintainer: Marco Asa <marcoasa90 (at) gmail.com>

pkgname=xfdashboard-theme-minimal
pkgver=20221124
pkgrel=1
pkgdesc="Themes for xfdashboard by MaysunFalls"
arch=('any')
url="https://github.com/Maysunfalls/XFDashboard-Minimal-Theme"
license=('custom')
depends=('xfdashboard')
source=('https://github.com/Maysunfalls/XFDashboard-Minimal-Theme/raw/main/xfdashboard-minimal.tar.xz')
sha256sums=('7c7eab4e818c24c81bb4617a1477e1b18eba4fca8918648a28d7bf38d935bab1')

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    tar -xvf xfdashboard-minimal.tar.xz -C "$pkgdir/usr/share/themes"
}

