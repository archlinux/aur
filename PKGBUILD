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
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '12ecc1b468d8125aef1519cad1e1e4035c90acb9b5de75eaf6c9ee5215d0e2fe53173ab440a7283b99173747c762bde3ec897ef506b04dd042121045d6a3398a'
  'e3f85bd3c63d2bbbce10c57cc004749f2b00e7f3fc0b713600371b69f02a802f11d5abe7131a9229722424f51032abd5c8eac954640deb6b999023ce1901225c'
  )
md5sums=(
  '7b26e801f11d672f4702faf712332ab4'
  '5c7101c515bb1862fe3de3a6f93e032e'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
}
