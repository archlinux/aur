# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=pass-tessen
pkgver=1.5.1
pkgrel=1
pkgdesc="A fuzzy data selection and copying interface for pass"
arch=(x86_64)
url="https://github.com/ayushnix/pass-tessen"
license=('GPL')
depends=('pass'
         'fzf')
optdepends=('wl-clipboard: to copy text in wayland'
            'wl-clipboard-rs: to copy text in wayland'
            'xclip: to copy text in xorg')
conflicts=('pass-tessen-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ayushnix/pass-tessen/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70b121dca861f3f16252afb77ec26068d19039f0772d36ebdb05d823f779af53')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
