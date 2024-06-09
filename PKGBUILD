# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-frappe
pkgver=0.3.1 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Frappe'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-frappe-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-frappe-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-frappe-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-frappe-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-frappe-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-frappe-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-frappe-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-frappe-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-frappe-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-frappe-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-frappe-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-frappe-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-frappe-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-frappe-yellow-cursors.zip"
)

sha256sums=('ebf672f06bd0224825e84c6b2c0e3ac32c22ef725455edb739c334607369bab4'
            '59adfc954a212a1909db83add056314d749dd7b096109d931ba05dd1b7f901d9'
            '6d846f13cd8def09b6f50d7d79c10eeecadb3eb1c478394fa033b075474f484e'
            'f0018d83798ede8af5fa56782fd33d6a4fa1d909102d6ea0b0a814838f662b2e'
            'ff9f8aacd4e7e67654f3c338b2abe1dc7850689f1a7fe36c0da4c69e197432e4'
            '4301028d52896a316c37936d3c6287ccce827cbb09d3281fb5b26e6b8412d18f'
            'a94603aac2dbf53ddfdae4d9d66ef62ef6b6096b299429ec8f1abef334871cf3'
            'd988b29ad186aedfe8ca532d89b8feeeaef90cae04d1b8d85a0f63c21f35b53e'
            'c2180f45557025f94901adda9e81d63ad91420f263607a9374390f2608d045f7'
            'ee467aa95822c71ac9f5b31029f9acbb8bf5f30a6be7df4cc137c4329d5264c1'
            'b89e1639e68886c0a5fe82e6c6ab0e91abd2a437074c937b36bee0e6b14a642d'
            '37dbf2b7d03a1a1e47871b4ae9db27b55680a54dbf6fa1aa1837043ca29078ab'
            '1eab81cdc900a38f573f7b04d8a2a79fcd0ca179e5e399189ae6a2000fd70910'
            'a056c2f7e2933bdce00f016dcf4ecf91d5f28f61aeb8eaa7b6bad78c9660a61c'
            '6607b1d810ed038fb0f903f88511fdfb62ef930f213b28a9621e342f5cf8713e'
            'cdf11264faf51f103c965410a239a3b1529e11d5e6e2194ee318f7bdfeb101b5')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/icons"
}
