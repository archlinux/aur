# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple snippet manager for your predefined Ultisnips Snippet Directory"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(neovim)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'c7ae7494d57af6b339d4daf35b271e58e8680fccdab33fa869bbc233ebb632fd4e64c896fb397939db3930fd61e5ad66a31bb167fefae43bc52b21fcea021b47'
  'b6ed88aab5ae2590283f06c4dc8c187be431908f7e052263898bc246acc4e55db2302370baa68a588cd2e22c1cf6e4cc0144b6c058f8945a2aa702add9b7b1e4'
  )
md5sums=(
  'e8a107fc377133139e90568b1f83007c'
  'ea2e53329f99032a6c513b62d4c4cd6b'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {  
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
