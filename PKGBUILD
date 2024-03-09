# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

pkgname=kf6-servicemenus-rootactions
pkgver=1.0.0
pkgrel=4
pkgdesc='Allows admin users to perform several root only actions from dolphin via polkit agent.'
arch=(any)
url='https://codeberg.org/stefanwimmer128/kf6-servicemenus-rootactions'
license=(GPL-2.0-or-later)
depends=(dolphin kdialog perl polkit)
makedepends=(git)
optdepends=(kate)
replaces=(kf5-servicemenus-rootactions kde-servicemenus-rootactions)
conflicts=(kf5-servicemenus-rootactions kde-servicemenus-rootactions)
source=("$pkgname::git+https://codeberg.org/stefanwimmer128/kf6-servicemenus-rootactions.git#tag=v${pkgver}")
sha256sums=(SKIP)

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
}
