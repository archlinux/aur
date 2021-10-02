# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=pass-tessen
pkgver=1.5.3
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
sha256sums=('67a7b17d7a3099c0660f54a638238b8250d5fdef319ba10f5a147fc7cd39f600')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
