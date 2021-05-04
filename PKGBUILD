# Maintainer: sife <wyattgoettsch@gmx.us>

pkgname=dmenu_bw
pkgver=0.0.0
pkgrel=1
pkgdesc="dmenu wrapper for bitwarden-cli written in POSIX shellscript."
arch=('x86_64')
url="https://github.com/Sife-ops/dmenu_bw"
license=('GPL3')
depends=('jq' 'yad' 'xclip')
optdepends=('libnotify' 'dmenu')
provides=('dmenu_bw')
conflicts=('dmenu_bw' 'dmenu_bw-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sife-ops/dmenu_bw/archive/v${pkgver}.tar.gz")
sha256sums=('2d3011b87b72589323e0e38805aa3663598c06d68165f111aa5ce3449492087c')

package() {
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm755 "${pkgname}-${pkgver}/dmenu_bw" "${pkgdir}/usr/bin/dmenu_bw"
}
