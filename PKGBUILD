# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
pkgname=marmite-bin
pkgver=0.2.5
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
sha512sums=('af4a27b2c69f658020f7a9f0ed24c78853de06668e9a847aa8298e05b0a53a71167a471dd5b0bb9d716c004ddada9f84e595279d3de1a36d18c49cd0ab960e5d')

package() {
    install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
