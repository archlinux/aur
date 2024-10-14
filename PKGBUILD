# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-latte
pkgver=0.4.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('4a230e520b31e064cfb9d933501b4e1ac567ee4d9d7031a69b75b84b9941d69d'
            '94eb287b8fdfe3fa4e96aa9336e44b3c516b2cf98ee5c0eca9c725890ada1f9e'
            '34b658b8ba0151da76c4da60144943927822e6189130f5c8b0ea79648c582ca4'
            '1f942a74e2729e7de454ed2fdb2a193345aa1a4f3de7d50e530b34a4d022c0e7'
            '6e721186fc8132b8ffb7a87be305ef2a5926cb20b913462401bbae08fae99bd2'
            '123bdef42c1bbf3c1a765c4558faa9f233f3f0cad548048c47ffbbdd9e1d8548'
            'de7d97d499f53e2e40aff745980ac7a3407bf22fd8e4bf4307dc3621e1af1a29'
            '95f7eb8d7cc73058ab8d5475993c8d3e4b180a2a361497b0e89b9491e89c65f3'
            'c3eb88f3349505a010f2da9c9a42f3d453efbf33f74fb93aee64155f138e6ccd'
            '409e7e37654dd43c87c44933e70ad99a25495bb1168ec36af053a8fad4dfa68d'
            'b9dc44aea4a8a155731c0d3c701fdc6db4ac13d3ed3be0025f489b4fbcc7b7ec'
            '81964ca34b995fe8d20c0435cc8ea981ee16162adf78c9e47a9cf1b42c6c938c'
            '284d6de14fbb0790a0f9a559eec09185f6d88599d9ddec2cd46783306915fe00'
            'a4cc0f72ae891603a57eb60cf98fac43ae9bd6c703e69761591bb3283afb525b'
            '834476c9c8e903569ddaac8ca5ccf7d48e6cb79498ffffd72e6d048672e38097'
            '2d7b99229a55fe6743c6d375358462cf72b2f3a1e30ac6cf4a7097ccd313e0f9')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/icons"
}
