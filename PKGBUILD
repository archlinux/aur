# Maintainer: Ashymad <czilukim@o2.pl>
pkgname="otf-code-new-roman"
pkgver="2.0"
pkgrel=3
pkgdesc='Monospaced font aimed for use in programming environments'
arch=('any')
url='http://fb.com/Code.New.Roman'
license=('custom')
depends=(fontconfig xorg-font-utils)
source=('CodeNewRoman-Bold.ttf::https://github.com/chrissimpkins/codeface/raw/master/fonts/code-new-roman/Code%20New%20Roman-Bold.otf'
	'CodeNewRoman-Italic.ttf::https://github.com/chrissimpkins/codeface/raw/master/fonts/code-new-roman/Code%20New%20Roman-Italic.otf'
	'CodeNewRoman-Regular.ttf::https://github.com/chrissimpkins/codeface/raw/master/fonts/code-new-roman/Code%20New%20Roman-Regular.otf'
	'https://github.com/chrissimpkins/codeface/raw/master/fonts/code-new-roman/license.txt')

sha256sums=('42d7dd94691a24bc3aece8489c24c8050250b320a6ec1d250115dafbfa0314f3'
            '3d2f971aa1829cca3df46cdf9f4385c57afba9e507b1821ba64d73dc1cc7ec08'
            'dfa19137778f3af70380f68452dc1c2ab364597cddda80a10819e46e35c1b984'
            'bd5d5113498de3036d9d5c9c11d0f744cd79d31146f27ef6f7bcf8877acfdd94')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
