# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.2
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
  '804e1416c953c7d7631d2b0d10008186abd2f0d6b97e773a1c8c6f6a77942dce4cecb1cd37e15fc4acb00ceb3c96220720ab4233e69f79391c8fb6e7de9c385c'
  'c1c55c9345a5999246ccb48c10366e5ad1b6e4f195553eaadcd1b3c60d3e632f2bcc571e6aeb79cd5277aeeda869ec70a284f383fcdc733634a158cde30de60f'
  )
md5sums=(
  '9b7d19d355d487489972d10b017aa8e2'
  '46bd33ac680b81b66e4d4a049b472db2'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
