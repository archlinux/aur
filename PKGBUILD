# Maintainer: chn <g897331845@gmail.com>
pkgname=nameof
pkgver=0.10.0
pkgrel=1
pkgdesc='Nameof operator for modern C++, simply obtain the name of a variable, type, function, macro, and enum'
arch=('any')
url='https://github.com/Neargye/nameof'
license=('MIT')
source=("https://github.com/Neargye/nameof/releases/download/v$pkgver/nameof.hpp")
sha512sums=('1f6620077484f5046f14ce26617e0d22c749bbd0c79a57e5575e41af728643f9d37c46ae68b46de5870fef39172c057ab9bb3a53d35d2de58acf44226bc04b3e')
package() {
    mkdir -p $pkgdir/usr/include
	install -Dm644 "$srcdir/nameof.hpp" "$pkgdir/usr/include"
}
