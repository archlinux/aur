# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Orffen <orffen@orffenspace.com>

pkgname=otf-aileron
pkgver=0.102
pkgrel=5
pkgdesc="A grotesque sans-serif font by dot colon."
arch=('any')
url="https://dotcolon.net/font/aileron/"
license=('CC0-1.0')
source=("https://dotcolon.net/files/fonts/aileron_${pkgver//./}.zip")
sha256sums=('a93a1327f44912a7b1410ad0056fec3e904074413b0bd9da550f6175587cf958')

package() {
	install -Dm 644 Aileron-*.otf -t "$pkgdir/usr/share/fonts/OTF/"
}
