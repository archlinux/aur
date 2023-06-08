# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=plasma5-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
pkgver=2.2
pkgrel=1
pkgdesc="KDE Plasma wallpaper plugin that blurs the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc928ade4aeced817513fd586c3be4ed8d5ff68b2168ef6e8a1c22539b45db60')

package() {
    install -dm0755 "$pkgdir"/usr/share/plasma/wallpapers/a2n.blur
    cd "$srcdir/${_pkgname}-${pkgver}"
    ls
    cp -r  * "$pkgdir/usr/share/plasma/wallpapers/a2n.blur"
}
