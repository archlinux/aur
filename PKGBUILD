# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>

pkgname=wps-office-mui-ru
pkgver=11.2.0.9255
pkgrel=1
pkgdesc="Russian mui traduction for WPS Office"
arch=(any)
url="https://github.com/wachin/wps-office-all-mui-win-language"
license=(GPL3)
depends=(wps-office)
conflicts=()
source=(https://github.com/wachin/wps-office-all-mui-win-language/releases/download/${pkgver}/mui.7z)
sha256sums=('435ddb2b50163993e973b2151f92e5b830ab7373bc984fa4928393db69e7953a')

package() {
	cd "${srcdir}"
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU mui/ru_RU/*.{qm,png,rcc,conf}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/config mui/ru_RU/config/localizedfunctionname.cfg
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/data mui/ru_RU/data/dgres.ini
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/l10n mui/ru_RU/l10n/{common,wps}.cfg
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/resource/eula/image mui/ru_RU/resource/eula/image/*.{gif,png}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/eula mui/ru_RU/resource/eula/{error.html,wait.html}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/resource/watermax mui/ru_RU/resource/watermark/display.ini
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/resource/watermax/information/preinstall mui/ru_RU/resource/watermark/information/preinstall/*.doc
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/resource/watermax/information/user_defined mui/ru_RU/resource/watermark/information/user_defined/addwatermark_buildin_wps.doc
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/resource/watermax/images/preinstall mui/ru_RU/resource/watermark/images/preinstall/*.png
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/resource/watermax/images/user_defined mui/ru_RU/resource/watermark/images/user_defined/*.png
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates mui/ru_RU/templates/*.{wpt,dps}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates/coverpage mui/ru_RU/templates/coverpage/display.ini
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates/coverpage/buildin/lengthwise/Business mui/ru_RU/templates/coverpage/buildin/lengthwise/Business/*.{doc,png}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates/coverpage/buildin/lengthwise/Resume/ mui/ru_RU/templates/coverpage/buildin/lengthwise/Resume/*.{doc,png}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates/coverpage/buildin/lengthwise/Thesis mui/ru_RU/templates/coverpage/buildin/lengthwise/Thesis/*.{doc,png}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates/coverpage/buildin/transverse/transverse mui/ru_RU/templates/coverpage/buildin/transverse/transverse/*.{doc,png}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates/"Wpp Default Object" mui/ru_RU/templates/"Wpp Default Object"/*.{pptx,xml}
	install -Dm644 -t "${pkgdir}"/usr/lib/office6/mui/ru_RU/templates/"Wpp Default Object"/"Slide Layout" mui/ru_RU/templates/"Wpp Default Object"/"Slide Layout"/*.xml

}
