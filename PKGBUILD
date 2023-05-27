# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=plasma5-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
pkgver=2.1
pkgrel=1
pkgdesc="KDE Plasma wallpaper plugin that blur the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git)
conflicts=(plasma5-applets-window-title)
provides=(plasma5-applets-window-title)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('450af7435b27860104da07d40ce1dd69cf47213f43b8b44e738eefc747385076')

package() {
    install -dm0755 "$pkgdir"/usr/share/plasma/wallpapers/a2n.blur
    cd "$srcdir/${_pkgname}-${pkgver}"
    ls
    cp -r  * "$pkgdir/usr/share/plasma/wallpapers/a2n.blur"
}
