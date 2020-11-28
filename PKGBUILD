# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.10.2
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('1854303441890404d58da111faaf310bf1a06956202a4f72c2140eb6337bb3ba137b8c204d3f21e1983992e501865712adcc9f4b6f88f8248cbf59b8cf53c5f1'
                   '25c1c5af5ac3c2d93b5dcc9eea104c099303bb27be64f788952b63e26eda1af3820976beecffc88f5a3f5b7e5fe61ee37f2587ae7d6f2c271077013166774b02')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
