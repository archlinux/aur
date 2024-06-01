# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-macchiato
pkgver=0.3.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Macchiato'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-cursors.zip"
)

sha256sums=('d8a0a4774183e46b7f8de094d0c5a6d066de4ef89b6c7a4bcd948b9a5ac8fac2'
            '2523e7a0b3c82f19f19032b6688507762c1fd300ad6626e338c710d052e8492f'
            'ce21f4117c81f6b30642fbab31d7282bbce001facc9da7f900880659443c532b'
            'b6c1364e98bfb8912d76268991f5822aa01eaf12d25bfb42ef7c140a6951d200'
            'dd01365da47e4bd56e98841b5f2fe97467c94dbe55ae6f85cd796cbf3cb9089f'
            '0487a19a8f38b0ff0c48802bc508f3b90cd06c9f303670a425773cae232c4241'
            '45e69c26c3bd593d0ed826923f330fe27f3efc58ce0c47777c068bbbc4c3edec'
            'f3b37924912b56c96777e4ce1addc7ce5d3735db542c33adeb7d2ef270f382b0'
            '4f6d549a4069b20bfc6076bfc946a01591c5e38cc77817cd3e82b7928d53b6bb'
            'c7fd499c70abb69ca0f6b53e0eefaa27cf6c5a5212eb51785aaae191bcafb6b0'
            '5e3385c3c98b53c5f7b7dca7b1364a00d6db2f82d12604fa62a41ba704f2f332'
            '585ef24d54b9caa6898cba35cc1075cb4be2a343bc1de1ea33eed67b050ecea0'
            '6ac53b8dcef94a18d062a8338c0a081fe1ed9eb3ff077d2b0a3dea439dc7c363'
            'db50f0e6587aeb499a2895e930ca2c4dd39fda2d48eaf65bdbaa8b47ed8fbef4'
            '77d3a35afdc9f341585618e5aaed40e5ce8c966d14575942ec8f4e4ec397ce54'
            '1a269719f8e3450d90d83a730bc5abba73ea00efaf36e8e8a4bba6a442858fdc')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/icons"
}
