# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=ttf-tengwar-annatar
pkgver=1.20
pkgrel=4
pkgdesc="The Tengwar Annatar ttf font family. (Tolkien Elvish)"
license=("custom:tengwar-annatar")
arch=("any")
url="https://github.com/luxcem/ttf-tengwar-annatar/"
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/luxcem/ttf-tengwar-annatar/archive/refs/tags/v1.20.tar.gz"
  "COPYING"
)
sha256sums=('eee41a2d0cb7358465c7ab3dcb170a83d000df5ee3301b2b8a1e248f9f3665df'
            '5a61ec711b73cdd8b5c290d09913f0a26d05b93b06d49241a37c34166b27da7c')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" ttf-tengwar-annatar-1.20/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" COPYING

  install -Dm644 ttf-tengwar-annatar-1.20/readme.txt "$pkgdir/usr/share/${pkgname}/README"
  install -Dm644 ttf-tengwar-annatar-1.20/tngandoc.pdf "$pkgdir/usr/share/${pkgname}/README.pdf"
}

