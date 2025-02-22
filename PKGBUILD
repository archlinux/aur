# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-latte
pkgver=2.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('9216822b1570c99b6ad3fd40b3912cbd5681e7cd671c7c6b0f2810d55f9a17a6'
            '0b39cfc2d367cdde6b876a1afb649da8cc56c1d8ddd7b50abbe9ef53dc5f9699'
            '104073b7629217e7b94a9bc8515a6cc502a0fb5dc7c30d01c67f5bee4e906b50'
            'd7e8587ac7035bb72bf6bfbca6cab11a08bd6dcebac64bb68fbb92481f990ead'
            'aafeaf85253e561b3ce7d00f8b846c80aca99b4f13fdfc7a2eda242a2cc2cbdb'
            '4c0752cfa2da6c4cbcfe9539ca92585144b34651f22acf6cecf18850cb938880'
            'd14406ea4fd3ef99bda5881a76c080b1d94da14e0231e35353578b49e396a7d7'
            'a7fc7dc57c7121bd8f1873dbfd5ce35ab317c6b472fcf69681b3a17d2649220e'
            '9cd63616d56ad111ef5f35fc92ca481fffe61a97f29a17248d52c9de7651db48'
            'ddd89d8fe90202f8041445f0a404c9bed09401be01f742fd7028f328d9f47d1e'
            '1a203d7029f7770aa71e1f65833acdef3d709cdabe079459eddd32a1f115e89e'
            '0221caa3bb5787745254bdee4a039fdd3c86ee827933f9c1e2c4b8e530c04d0f'
            'f320e10db1ac1f652979e37412d042a47c605d9e4a927c1557efff7448cf99d2'
            'a4bfdbbb7c8133cae057de81ec640ee47100b237ffc47134bebe5ed5207aad01'
            'd491a44af4ffffd907945028df90328f9c1a6cb70578f336141e87fb58ffd52a'
            'e8fa51fb0256b6a19ac1a590240453b29df99d4f9f399693216856b0458c5342')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/icons"
}
