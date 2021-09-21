# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=pass-tessen
pkgver=1.5.2
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
sha256sums=('d6afdc2b8acf4bb812a05f7770ea7e1ae1e39b4c41336a54eb0b22b14fadfc0a')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
