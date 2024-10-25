# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-latte
pkgver=1.0.1 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Latte'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-latte-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-latte-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-latte-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-latte-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-latte-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-latte-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-latte-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-latte-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-latte-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-latte-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-latte-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-latte-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-latte-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-latte-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-latte-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-latte-yellow-cursors.zip"
)

sha256sums=('5310a78f2e1c9cf24d12ccdcb13c71fdaf06725b8ea8c472bbee79068c82e140'
            '3b803e73f1093a2df36da6a9233feffa8cccd5e27dc6f2c30bb335fea4a33236'
            'd6d11f292b9292981f1c52faa366912b8f18693d89e420d2fc589daa3e9f8ef1'
            '0d499c1a5673bd82cc5034194620e8ff92eea0ac8e032d91a7cd185e120938c1'
            '4c642cc2b54ad8b921cf6fa6589e04140c4d94ecc89e000205b5403ccbe13671'
            'd628d2642ee721c7d8ecc042619e3c2e3f1fa3bc307a2c966dac5dcfc34a3e5a'
            '15f2d31c05d0261d6d9b81dbfdae7dae3231a35418360bedcfd713cef46cad03'
            '13020905b89a9f8e7f4a54d44f2fc3363ac60fbbf874e080183f804c0eac618c'
            'ad38cea86dad6887cc60174526efdfe92fc506482c999345cdf8e57d5e480ef5'
            '725a27246db297bf0ceee197640539a063e240b7cbb4fd8856e5a6fb55a4cd86'
            '83d0a1f7b55e5a7f378486cdc9cf84ac026afc09042b80a92860b5b69ef5d801'
            'e7b9e0018c4e28d87ece566678acd4878168379914e1f7669e6e2da18d5289bb'
            '31b888ddd0da8f891aa95bb38ee227465b67509432e1ebba3f2b91e3be81e000'
            '7013d5b651fd34c9b61800051a39c2393d2b52ead4ff3816ee04eca01aabcdbf'
            'e408f895fbd7deac76886052582d2ea2acbfb5d4fa4e0268256142b3bc2e8b0c'
            '1e9ed45affcc9e8fd5dfaf6a571029827faf027d2768bd3596728f36bed95e7b')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/icons"
}
