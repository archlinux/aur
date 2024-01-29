# Maintainer: Niklas20114552 <niklas.deppermann@outlook.com>
pkgname="otf-material-design-icons"
pkgver=4.0.0
pkgrel=1
pkgdesc="Font with every Material Icons"
arch=(any)
license=("Apache 2.0")
url="https://github.com/google/material-design-icons"
source=("https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIconsOutlined-Regular.otf" \
"https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIconsSharp-Regular.otf" \
"https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIconsRound-Regular.otf" \
"https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIconsTwoTone-Regular.otf" \
"https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIcons-Regular.ttf")
sha256sums=("b63fa9edd75e3c20328e04ad31dcc38ce76411f3f9ea1a1ff87f49e5ba874b05" \
"095a95043a8574c90770ecdc0af53f8b8b5043a816320107e55e2d237d8ff9de" \
"bad85e5454b6288104ce03806c37323bcd8f145e3094e727860173ac8c91062e" \
"03ccf13774af5b5cbbad641dfa33038d4e9f4b7979eedc2c0a15f06bf9eb33cd" \
"ef149f08bdd2ff09a4e2c8573476b7b0f3fbb15b623954ade59899e7175bedda")

package() {
	install -Dm644 "$srcdir/MaterialIconsOutlined-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIcons/MaterialIconsOutlined-Regular.otf
	install -Dm644 "$srcdir/MaterialIconsSharp-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIcons/MaterialIconsSharp-Regular.otf
	install -Dm644 "$srcdir/MaterialIconsRound-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIcons/MaterialIconsRound-Regular.otf
	install -Dm644 "$srcdir/MaterialIconsTwoTone-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIcons/MaterialIconsTwoTone-Regular.otf
	install -Dm644 "$srcdir/MaterialIcons-Regular.ttf" ${pkgdir}/usr/share/fonts/MaterialIcons/MaterialIcons-Regular.ttf
}
