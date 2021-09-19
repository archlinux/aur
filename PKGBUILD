# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=pass-tessen
pkgver=1.5.0
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
sha256sums=('2b0afe22e6f84d33076b51ad7294b8f77ecc758ed3842db9c0e6a18e2aa711e1')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
