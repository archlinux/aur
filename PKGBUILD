# Maintainer: Jorge Pizarro-Callejas (jorgicio) <jpizarroc at gmail dot com>

pkgname=wps-office-mui-es-es
pkgver=11.2.0.9255
pkgrel=1
pkgdesc="Spanish (Spain) mui package for WPS Office"
arch=(any)
url="https://github.com/wachin/wps-office-all-mui-win-language"
license=(GPL3)
depends=(wps-office)
conflicts=()
source=(https://github.com/wachin/wps-office-all-mui-win-language/releases/download/${pkgver}/mui.7z)
sha256sums=('435ddb2b50163993e973b2151f92e5b830ab7373bc984fa4928393db69e7953a')

package() {
	cd "$srcdir"
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES mui/es_ES/*.{qm,png,rcc,conf}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/config mui/es_ES/config/localizedfunctionname.cfg
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/data mui/es_ES/data/dgres.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/l10n mui/es_ES/l10n/wps.cfg
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/resource/eula/image mui/es_ES/resource/eula/image/*.{gif,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/eula mui/es_ES/resource/eula/{error.html,wait.html}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/resource/watermax mui/es_ES/resource/watermark/display.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/resource/watermax/information/preinstall mui/es_ES/resource/watermark/information/preinstall/*.doc
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/resource/watermax/information/user_defined mui/es_ES/resource/watermark/information/user_defined/addwatermark_buildin_wps.doc
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/resource/watermax/images/preinstall mui/es_ES/resource/watermark/images/preinstall/*.png
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/resource/watermax/images/user_defined mui/es_ES/resource/watermark/images/user_defined/*.png
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/templates mui/es_ES/templates/*.{wpt,dps}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/templates/coverpage/buildin/lengthwise/Business mui/es_ES/templates/coverpage/buildin/lengthwise/Business/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/templates/coverpage/buildin/lengthwise/Resume/ mui/es_ES/templates/coverpage/buildin/lengthwise/Resume/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/templates/coverpage/buildin/lengthwise/Thesis mui/es_ES/templates/coverpage/buildin/lengthwise/Thesis/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/templates/coverpage/buildin/transverse/transverse mui/es_ES/templates/coverpage/buildin/transverse/transverse/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/templates/"Wpp Default Object" mui/es_ES/templates/"Wpp Default Object"/*.{pptx,xml}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/es_ES/templates/"Wpp Default Object"/"Slide Layout" mui/es_ES/templates/"Wpp Default Object"/"Slide Layout"/*.xml

}

