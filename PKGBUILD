# Maintainer: crimist <aur at crim dot ist>

pkgname=gnome-shell-extension-force-show-osk
pkgver=1.0
pkgrel=1
pkgdesc='Show the on-screen keyboard regardless of whether the touch mode is enabled'
arch=(any)
url='https://github.com/crimist/force-show-osk'
depends=('gnome-shell')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0fb3aa1efd5e80714a5d8b12bc73fe2ded1deb2161ea550e5d51d6ab390aebb8')

package() {
    install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/force-show-osk@crim.ist/" force-show-osk-$pkgver/*
}
