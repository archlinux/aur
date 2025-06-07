# Maintainer: Dvd-Znf <email@dvdznf.xyz>
# Contributor: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=1.0.3 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=1
pkgdesc='Soothing pastel theme for GTK - Macchiato'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-standard+default.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-standard+default.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-standard+default.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-standard+default.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-standard+default.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-standard+default.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-standard+default.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-standard+default.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-standard+default.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-standard+default.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-standard+default.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-standard+default.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-standard+default.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-standard+default.zip"
)

sha256sums=('9d0d724a1bc696305722dd2bf19731570b20dd96fe4cb1d80b7ea18fc243dbf1'
            '4d2a03b82876fa94b12f6ea3054129a080a07a596cef000e4ce74639b9890d44'
            '8435e883fcd943df2cb516157f580559f5142a3dba6bbff62004693ec9b3f7b8'
            'b36a0a26440f23570780cc379e2922c33e84cf88dfecd31bd7603323f4fb43b0'
            'c053efa076dd0ca42618254a2cb4263d653fa9dd29ae105ac19b44699fefbfae'
            'b8186e47a9d09266f54b38c6e58dd2837fe53d9786532ce206c1fc3c7b658573'
            '18d646aba1a2e0a579c373cc776e464b418afc93be20ee3831dff01651d57816'
            '3486cda7371674b6c910c2494958226fa93c7cc22b530cff6fca0654fc3c1a4e'
            '6db078819919d22ee27fd7450354142060eb723b917f00b1be4425387988995f'
            'dbb6fd878f698c742edc835b831ff8d2a0ef36834fda9174f65816a6d2a39a4a'
            '6f8c50a822c2e6738dc171006ff8b02c6c40f23c81733dd6bfdb173cd75e9034'
            '91229b45b6414ed6262f295ff405452adfa2a55ec27b2e766028cbcc014dcde9'
            '1254d335c5d07d178f98d0b00c9d65f01e8f30dc6c71f975d122f20b253a6d76'
            '5f3bbf870d920f79895aa4f1ebc0e9c427a33b78b6b2a9023a8f71d5794ef0c7')
package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -r -a --no-preserve=ownership \
		catppuccin-macchiato-* "$pkgdir/usr/share/themes"
}
