# Maintainer: Ashymad <czilukim@o2.pl>
pkgname="otf-code-new-roman"
pkgver="2.0"
pkgrel=1
pkgdesc='Monospaced font aimed for use in programming environments'
arch=('any')
url='http://fb.com/Code.New.Roman'
license=('custom')
depends=(fontconfig xorg-font-utils)
source=('CodeNewRoman-Bold.otf::https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/Code%20New%20Roman-Bold.otf'
	'CodeNewRoman-Italic.otf::https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/Code%20New%20Roman-Italic.otf'
	'CodeNewRoman-Regular.otf::https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/Code%20New%20Roman-Regular.otf'
	'https://github.com/chrissimpkins/codeface/blob/master/fonts/code-new-roman/license.txt')

sha256sums=('176c33739b1bfd0122ae8094faf33ea532dcf30d0bb5188beee19c471c75c6b6'
            '002cbc9024de3d0e746e8d950a1611ab97c969aed1b57e0a0c017a5b25cffa59'
            'b4fd9bb47b80ffb0f8e1344a8aa65b646900b26288d24e90878383f53799c509'
            '03f80ed929ba7dd258fe98703bca8f2ca7b7b8e229f30d7b8bc68c646886777e')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 *.otf "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
