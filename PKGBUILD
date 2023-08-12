# Maintainer: gudzpoz <gudzpoz@live.com>

pkgname=profile-sync-daemon-thunderbird
pkgver=2023.08.12
pkgrel=1
pkgdesc="Thunderbird support for profile-sync-daemon"
url="https://github.com/graysky2/profile-sync-daemon/blob/master/common/browsers/firefox"
arch=('any')
license=('MIT')
depends=('profile-sync-daemon')
optdepends=(
    'thunderbird: the target browser'
)
source=("thunderbird")
sha256sums=('3d38c6cf12865b189f562e6919efc7e905008099ad10a92096d3a9068269568e')

package() {
    install -Dm644 thunderbird "${pkgdir}/usr/share/psd/browsers/thunderbird"
}
