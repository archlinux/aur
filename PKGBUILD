# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=1
pkgdesc='Soothing pastel theme for GTK - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-latte-blue-standard+default.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-latte-flamingo-standard+default.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-latte-green-standard+default.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-latte-lavender-standard+default.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-latte-maroon-standard+default.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-latte-mauve-standard+default.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-latte-peach-standard+default.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-latte-pink-standard+default.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-latte-red-standard+default.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-latte-rosewater-standard+default.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-latte-sapphire-standard+default.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-latte-sky-standard+default.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-latte-teal-standard+default.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-latte-yellow-standard+default.zip"
)

sha256sums=('924331fe97e768f665c234c464e0cebefbd6dd320a7a9a9af45d302d6931e8ec'
            '4d9e21b61a10c3e6ec9b68ec02533e9db78d5b9351caa0c81eea8855a1b730cd'
            '3415f2489d8467bb749a9bc5bb0e0233e473355370172319c962e554fd2600cd'
            'afc0978734dca61e94521afd62400e6984376b944f47c5943c331dec61755c26'
            '14a1045d619b9a2baf514e1dbc6b689ffb36b7019a0babaf1a49892e26d1a634'
            '9415ddd03b1b89294464473a206652c6866d64465fc7b45b453dd0bd93d120ee'
            '8a02eb60b6175decfdc010b4a7c551a5dd9af88ba36124c2ac09f212b077b238'
            'a02c9df7e32bd1a563e7c274d4c5af7691b22710b9b02c65cb2d0d5c97fac624'
            'd6d3adf1d3f8034389828b448cf810ffbfa8fc9642d7b39b48c2a18ba29b081b'
            '117f3bb174e295956aa2f23568d75b72ae349994e0bb23e6ecdca44856ef7f7f'
            'e38b15bed86d2138a8b54f6b1240ea88772cbf9c4e431e76b5b874710ae2646a'
            'f7789f66b0445674d2ff61749816319a39eab9609f6049528cda70a834cd3cf4'
            '836ac3d0ad4222cd783dbbb3ff69a2f985a2f2d945f218b9fe9357ea5ae1d2a0'
            '8bcb64a14dcf23cbfb0a44e90d01b22367fc4d86e7fbed1826fc3d0feca5319e')
package() {
	install -d "$pkgdir/usr/share/themes"
	cp -r -a --no-preserve=ownership \
		catppuccin-latte-* "$pkgdir/usr/share/themes"
}
