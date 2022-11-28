# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=toolkit
pkgver=0.1.0
pkgrel=1
pkgdesc="A toolbox for the CLI, rapidly speeding up file editing and data management processes."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(bat)
optdepends=('nvim: the recommended editor for power users')
conflicts=(qed)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '30fa226e455517c7239d89b69e7b8ce1c11cef3ae378535a815aa39d6bb29b1406da71a4eed5acf31e20f375037b1504247fc3ecd88ffb613421b17f44a54fd2'
  'a7f77ef686eca2910fe6deb589b15303f07b9440d8143bf0a19f2df414c46849b57e09701a3e45467ba9e15fa3ed046ee28658781b53b4b7d5bddd185fba1a64'
  )
md5sums=(
  '4c3bfb6014949e099e51b1cb65602cea'
  'bd8e89b3c8459d597c47fe5b39a05fcb'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
}
