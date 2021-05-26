# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=diary-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Encrypted memories -- a journal program with local encryption support (binary release)"
arch=('x86_64')
url="https://github.com/actuday6418/diary"
license=('GPL3')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/diary"
        "README-$pkgver.md::https://raw.githubusercontent.com/actuday6418/diary/$pkgver/README.md")
sha256sums=('c5f95be4088e353b965268460fe46caabb2d2dd836fcd068d855d2be38889661'
            '4a7ab6592482adf9da57d64cab3fac2721768065cdf46e64172ced9db7c1d7e3')

package() {
  install -Dvm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/diary"
  install -Dvm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

