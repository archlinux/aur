# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
pkgname=marmite-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Markdown makes sites - A Static Site Generator for Blogs. Binary From GitHub Release"
arch=('x86_64')
url="https://rochacbruno.github.io/marmite/"
license=('AGPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
)
provides=('marmite')
conflicts=('marmite')

source=("https://github.com/rochacbruno/marmite/releases/download/${pkgver}/${pkgname/-bin/}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums=('cb15c89d6d9e8e14c6359af05f5d8188c13108072a312c5a1618ccd3b08e0af7f2bb32dbed6799eb9f0e81ec35948207a476608125f33bba247fc9260d63a645')

package() {
    install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
