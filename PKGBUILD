# Maintainier: FadeMind <fademind@gmail.com>

pkgname=kdeartwork-wallpapers-minimalism
pkgver=20160102
pkgrel=1
pkgdesc="Minimalism Wallpaper for KDE Plasma 5"
arch=('any')
license=('unknown')
url="http://www.goodfon.su/wallpaper/minimalizm-monitor-kompyuter.html"
source=("${pkgname}.zip::https://copy.com/DnDLfiRJfXd4v83I/Minimalism.zip?download=1")
sha256sums=('469353d0efe2a7cecb0a56393843d59a155d1f3092f6e1d2260636c7006a1f95')

package() {
    find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/wallpapers/{}" \;
} 
