# Maintainer: Maël <alemswaj+tutanota+com>

pkgname=wps-office-mui-fr
pkgver=11.2.0.9255
pkgrel=1
pkgdesc="French mui traduction for WPS Office"
arch=(any)
url="https://github.com/wachin/wps-office-all-mui-win-language"
license=(GPL3)
depends=(wps-office)
conflicts=()
source=(https://github.com/wachin/wps-office-all-mui-win-language/releases/download/${pkgver}/mui.7z)
sha256sums=('435ddb2b50163993e973b2151f92e5b830ab7373bc984fa4928393db69e7953a')

package() {
	cd "$srcdir"
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR mui/fr_FR/*.{qm,qm.rule,png,rcc,rcc.rule,conf}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/config mui/fr_FR/config/localizedfunctionname.cfg
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/data mui/fr_FR/data/dgres.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/l10n mui/fr_FR/l10n/{common,wps}.cfg
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/resource/eula/image mui/fr_FR/resource/eula/image/*.{gif,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/eula mui/fr_FR/resource/eula/{error.html,wait.html}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/resource/watermax mui/fr_FR/resource/watermark/display.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/resource/watermax/information/preinstall mui/fr_FR/resource/watermark/information/preinstall/*.doc
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/resource/watermax/information/user_defined mui/fr_FR/resource/watermark/information/user_defined/addwatermark_buildin_wps.doc
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/resource/watermax/images/preinstall mui/fr_FR/resource/watermark/images/preinstall/*.png
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/resource/watermax/images/user_defined mui/fr_FR/resource/watermark/images/user_defined/*.png
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates mui/fr_FR/templates/*.{wpt,dpt,dps,dotm}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates/coverpage mui/fr_FR/templates/coverpage/display.ini
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates/coverpage/buildin/lengthwise/Business mui/fr_FR/templates/coverpage/buildin/lengthwise/Business/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates/coverpage/buildin/lengthwise/Resume/ mui/fr_FR/templates/coverpage/buildin/lengthwise/Resume/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates/coverpage/buildin/lengthwise/Thesis mui/fr_FR/templates/coverpage/buildin/lengthwise/Thesis/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates/coverpage/buildin/transverse/transverse mui/fr_FR/templates/coverpage/buildin/transverse/transverse/*.{doc,png}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates/"Wpp Default Object" mui/fr_FR/templates/"Wpp Default Object"/*.{pptx,xml}
	install -Dm644 -t "$pkgdir"/usr/lib/office6/mui/fr_FR/templates/"Wpp Default Object"/"Slide Layout" mui/fr_FR/templates/"Wpp Default Object"/"Slide Layout"/*.xml

}

