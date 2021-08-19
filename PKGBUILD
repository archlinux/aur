# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Orffen <orffen@orffenspace.com>

pkgname=otf-aileron
pkgver=0.102
pkgrel=4
pkgdesc="A grotesque sans-serif font by dot colon."
arch=('any')
url="https://dotcolon.net/font/aileron/"
license=('custom:CC0')
source=("$pkgname-$pkgver.zip::https://dotcolon.net/download/fonts/aileron_0102.zip"
        "LICENSE.txt::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")
sha256sums=('a93a1327f44912a7b1410ad0056fec3e904074413b0bd9da550f6175587cf958'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package() {
	install -Dm 644 Aileron-*.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
