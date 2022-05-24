# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.3
pkgrel=1
pkgdesc="Easily set variables and their respective values for easy access at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xclip bat)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'c44ac791ecbf572732f23c797801bd2f90bfb4e6d690eec643166c80d0f1d2613c15296567c212071edda12b73de69ac775d447c60e32bd969a4093b012b6f9a'
  'daf0e8d48bf444ae314b57de6eb142bcdb84858c5edae2becd24e5cf9cce004fec21bc9bb202ec6590da11e68e9d230b850a3a810115bace7bf8cf24df5d8131'
  )
md5sums=(
  'cd375f0a025fb5715fc5bd22e15f86ff'
  'b2e16293fb036c2c5e6a953e156b64c4'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
