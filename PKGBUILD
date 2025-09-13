# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
pkgname=marmite-bin
pkgver=0.2.6
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
sha512sums=('5ce4a63fb0b6602c69941c00624f2016f7449b297eb5c149545cdf7c6f61233d8781c6452de75890eaf2fff52badc21bf5a7ccf0db58c6e33001195445364e95')

package() {
    install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
