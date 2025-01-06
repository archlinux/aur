# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
pkgname=marmite-bin
pkgver=0.2.3
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
sha512sums=('82d43d8a490f43de5d2430711a52875a6afd78541706533b929ca03de71a3af028f44f6d35baef4d6f354acdbcb7a38d3a0131586eb5b1c9d1a539165d7cc357')

package() {
    install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
