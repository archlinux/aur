# Maintainer: Bernardo Kuri <aur+psd-zen-browser@bkuri.com>

pkgname=profile-sync-daemon-zen
pkgver=1.0
pkgrel=1
pkgdesc="Zen browser support for profile-sync-daemon"
arch=('any')
url="https://github.com/graysky2/profile-sync-daemon/blob/master/common/browsers/firefox"
license=('MIT')
depends=('profile-sync-daemon')
optdepends=(
	'zen-browser: the target browser'
)
source=("zen-browser")
sha256sums=('7a66d5147a8f3acdb3c3679c0dcc6a4d576d6af735a0f276a3806363f8fda9fa')

package() {
    # Install PSD profile
    install -Dm644 "$srcdir/zen-browser" "$pkgdir/usr/share/psd/browsers/zen-browser"
}
