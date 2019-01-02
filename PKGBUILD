# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-shell-extension-do-not-disturb
pkgver=2.0.1
pkgrel=1
pkgdesc="Enable or disable do not disturb mode"
arch=(any)
url="https://github.com/kylecorry31/gnome-shell-extension-do-not-disturb"
license=(MIT)
depends=(gnome-shell)
conflicts=(gnome-shell-extension-do-not-disturb-git)
source=("https://github.com/kylecorry31/gnome-shell-extension-do-not-disturb/archive/v${pkgver}.tar.gz")
sha256sums=('bfc6c2cf5a9d48e63980d2f1c4394f1daae0baf9371a71f1411577452223c38f')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
