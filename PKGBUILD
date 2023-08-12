# Maintainer: gudzpoz <gudzpoz@live.com>

pkgname=profile-sync-daemon-zotero
pkgver=2023.08.12
pkgrel=1
pkgdesc="Zotero support for profile-sync-daemon"
url="https://github.com/graysky2/profile-sync-daemon/blob/master/common/browsers/firefox"
arch=('any')
license=('MIT')
depends=('profile-sync-daemon')
optdepends=(
    'zotero: the target browser'
)
source=("zotero")
sha256sums=('d0e3bac064279404cb15c9ab554eafa0499ae7044e65c06a6ab14f7e71d8cb83')

package() {
    install -Dm644 zotero "${pkgdir}/usr/share/psd/browsers/zotero"
}
