# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.4
pkgrel=1
pkgdesc="Easily set variables and their respective values for easy access at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xsel bat)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'ae0933af9d04281e6f0ac796e4326cf3353e811350d83ba6b64e08c94f17479e7b266b56748f231d0bdf4a40c7c2192dfd9ce5d48c1673c0865e749183c6dba6'
  '6d2152ebd4089c2d604b102c1a9e41c2ea881e0cb3a866de6e3bac7c6d0e9d5a214b3e2781ecdd424bef975d6aefaa04a8c2b08a30dfd173eb04fd433538fb13'
  )
md5sums=(
  '038be052b5f26b4343c492950b440738'
  'e773e7e093c54b2af509aeb2f9a32a8b'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
