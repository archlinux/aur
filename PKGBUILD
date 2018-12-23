# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-shell-extension-do-not-disturb
pkgver=2.0.0
pkgrel=1
pkgdesc="Enable or disable do not disturb mode"
arch=(any)
url="https://github.com/kylecorry31/gnome-shell-extension-do-not-disturb"
license=(MIT)
depends=(gnome-shell)
conflicts=(gnome-shell-extension-do-not-disturb-git)
source=("https://github.com/kylecorry31/gnome-shell-extension-do-not-disturb/archive/v${pkgver}.tar.gz")
sha256sums=('ccdf94ba24f9be4cf29230773f16a0f1a7f3dbddd7d8382f3e42fe70d6655331')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
