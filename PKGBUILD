# Maintainer: Daniel Barbosa <dbarbosa0 at gmail dot com>

pkgname=wps-office-mui-pt-br
pkgver=11.2.0.9255
pkgrel=1
pkgdesc="Português do Brasil para WPS Office"
arch=(any)
url="https://github.com/wachin/wps-office-all-mui-win-language"
license=(GPL3)
depends=(wps-office)
conflicts=()
source=(https://github.com/wachin/wps-office-all-mui-win-language/releases/download/${pkgver}/mui.7z)
sha256sums=('435ddb2b50163993e973b2151f92e5b830ab7373bc984fa4928393db69e7953a')

package() {
	cd "$srcdir"
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR mui/pt_BR/*.{qm,png,rcc,conf}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/config mui/pt_BR/config/localizedfunctionname.cfg
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/data mui/pt_BR/data/dgres.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/l10n mui/pt_BR/l10n/{common,wps}.cfg
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/resource/eula/image mui/pt_BR/resource/eula/image/*.{gif,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/eula mui/pt_BR/resource/eula/{error.html,wait.html}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/resource/watermax mui/pt_BR/resource/watermark/display.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/resource/watermax/information/preinstall mui/pt_BR/resource/watermark/information/preinstall/*.doc
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/resource/watermax/information/user_defined mui/pt_BR/resource/watermark/information/user_defined/addwatermark_buildin_wps.doc
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/resource/watermax/images/preinstall mui/pt_BR/resource/watermark/images/preinstall/*.png
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/resource/watermax/images/user_defined mui/pt_BR/resource/watermark/images/user_defined/*.png
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates mui/pt_BR/templates/*.{wpt,dpt,dps}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates/coverpage mui/pt_BR/templates/coverpage/display.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates/coverpage/buildin/lengthwise/Business mui/pt_BR/templates/coverpage/buildin/lengthwise/Business/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates/coverpage/buildin/lengthwise/Resume/ mui/pt_BR/templates/coverpage/buildin/lengthwise/Resume/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates/coverpage/buildin/lengthwise/Thesis mui/pt_BR/templates/coverpage/buildin/lengthwise/Thesis/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates/coverpage/buildin/transverse/transverse mui/pt_BR/templates/coverpage/buildin/transverse/transverse/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates/"Wpp Default Object" mui/pt_BR/templates/"Wpp Default Object"/*.{pptx,xml}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/pt_BR/templates/"Wpp Default Object"/"Slide Layout" mui/pt_BR/templates/"Wpp Default Object"/"Slide Layout"/*.xml

}

