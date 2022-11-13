# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.5
pkgrel=1
pkgdesc="Easily save important snippets such as passwords for quick access copying at any point"
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
  '5935298123959b35cedf18e8d16e7fa094a95e7d0f03d8020bbe9fb121021a88dbb21b4352a9c50cdeafc3dfd25f4070db59b124a7f0a63a3dcd4aeb4285efec'
  '7b87a0cba19856933a94a0b8689d0abcb52fd801e7ed2f190d3ce5781e316f6b12557ca25ca1153f4d4d12903cf279a246242cb8a4b40d9ae048c086ec495a1e'
  )
md5sums=(
  'a01b0429b54ccad3c19161f135a5a3f4'
  '557eeb36e0ae6ff28b9f7adb24a49ed4'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
