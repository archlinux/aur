# Maintainer: sife <wyattgoettsch@gmx.us>

pkgname=dmenu_bw
pkgver=0.0.3
pkgrel=4
pkgdesc="dmenu wrapper for bitwarden-cli written in POSIX shellscript."
arch=('x86_64')
url="https://github.com/Sife-ops/dmenu_bw"
license=('GPL3')
depends=('jq' 'yad' 'xclip')
optdepends=('libnotify' 'dmenu')
provides=('dmenu_bw')
conflicts=('dmenu_bw' 'dmenu_bw-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sife-ops/dmenu_bw/archive/v${pkgver}.tar.gz")
sha256sums=('a4f6a47c0742c3a9657afdf7acfafab21870369c0689d8aacab1153f8e1a8637')

package() {
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm755 "${pkgname}-${pkgver}/dmenu_bw" "${pkgdir}/usr/bin/dmenu_bw"
}
