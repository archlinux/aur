# Maintainer: Ashymad <czilukim@o2.pl>
pkgname="otf-code-new-roman"
pkgver="2.0"
pkgrel=2
pkgdesc='Monospaced font aimed for use in programming environments'
arch=('any')
url='http://fb.com/Code.New.Roman'
license=('custom')
depends=(fontconfig xorg-font-utils)
source=('CodeNewRoman-Bold.otf::https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/Code%20New%20Roman-Bold.otf'
	'CodeNewRoman-Italic.otf::https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/Code%20New%20Roman-Italic.otf'
	'CodeNewRoman-Regular.otf::https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/Code%20New%20Roman-Regular.otf'
	'https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/license.txt')

sha256sums=('0c15637fda6e2e72ae7fbe6b15b42519ca0046659eaf817fff9c3b05b5093e64'
            '4fcc5f409da410091f936ccc28383336abea4e55732e61b0b5ba57b406499a2e'
            '1d32e0203636a67eca7f0e5c3814d15634aee2ef6b0eff308f4f397b2315ca15'
            'a35a9f7fdc482e07ec535c14229966d3adcfa76e9cad89f6e4a7a8ac9a5843a4')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 *.otf "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
