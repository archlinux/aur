# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=2
pkgrel=1
pkgdesc="Easily save important snippets such as passwords for quick access copying at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xsel bat xdotool)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '774bf4d9e28ffa4e29ee27a815585d7fc453fb113e06e9e1da6560292d51847b5eb039c0b1c269bb61d3771aab8fdb40338166ac0bd1b91b22d88b24e538ff68'
  '009e5e9800067fcb36cd12479a2494762fadeeecd4ddf655a066762a7c3afb46d977478266e1602821f56e853504bd648e8c125bf17f52766f34d27ecd1c85c0'
  )
md5sums=(
  '995c40f7229239e7ccd4a4d072f6e86b'
  '8cc7b09a93c177fa00c031943759b2e0'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
