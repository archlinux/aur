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
  'bbadf1b4dbbc7db6f09247566d91a4e0cb8d4d04d0b253618ac9ee1984d4fef7564ce069f667ee53ecd0ddf83e681581083afab267eccc3c0be038ed447d6fbe'
  'ded245142573e8f4099942fdddd22db0c78af455cd46005bb93312d4d00ae8dc6d076e29c27a328ab2f2db8c0ed67d547d52f48e414730d3db83110eb4f8acc5'
  )
md5sums=(
  '022f311512a2acf367070f8f7d4bfbf6'
  '0b05bd893d8fdcc25b95a2de6ba12a12'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
    install -Dm755 usr/share/${pkgname}/lib/* -t "${pkgdir}/usr/share/${pkgname}/lib"
}
