# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=plasma6-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
pkgver=3.0.0
pkgrel=1
pkgdesc="KDE Plasma wallpaper plugin that blurs the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c13a0b77ed65f76ea0dba4cadb593116e2a3be0ec95e8ef73cf7ba493f99c00b')

package() {
    install -dm0755 "$pkgdir"/usr/share/plasma/wallpapers/a2n.blur
    cd "$srcdir/${_pkgname}-${pkgver}"
    ls
    cp -r  * "$pkgdir/usr/share/plasma/wallpapers/a2n.blur"
}
