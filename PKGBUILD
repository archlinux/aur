# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.0.0
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
  '6fa2c6c8927ea31f2d027f56e5ea067bbc8f85fba03d906328fa978cd16354743c77f15a34fac4e774d78704a06c621fcdfd0bf93e6e2d1681d529cf29bcf76a'
  'fb024bd78e756416c3deb8cdb6f0370c5e166b8147e53b41871eab7da1bc8f6bb7940da2927322f41aa4f16516b3f59b7d58cdb4bda0199a954325928cbb3df7'
  )
md5sums=(
  '156cbf24d96f22bde31469a51ad45ce5'
  'c52befe40eaeb382d4de3752c5ae6185'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
