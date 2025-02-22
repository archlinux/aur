# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-mocha
pkgver=2.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Mocha'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-mocha-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-mocha-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-mocha-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-mocha-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-mocha-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-mocha-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-mocha-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-mocha-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-mocha-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-mocha-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-mocha-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-mocha-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-mocha-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-mocha-yellow-cursors.zip"
)

sha256sums=('b498834df15c5c84a8a31ab7bd3f8e8d31e88b38f0d847759ec20943d016c66d'
            'a4d976491bdb1b1311b2de88327cad3f1c66c2d9da896e0c56362a660c802585'
            '06a5a3178a82591fc1a7ce8375e1d22845638e24409cb4375f6323f1c4027711'
            '376a59f36b190ecb6ee0bcbdf73c7f4f30a339f80d641a59f2b5f9b557ddc753'
            '9e8c67efd4c8ff75f09196fa8579ca366c5a4ea204f541edd7b49ab0cb44d9cf'
            '29e530a7e228396c9e4e35fc4b457fb4e77d2872e0ba88cd1ac4bce3099414e3'
            '20efcd020dd37468a0407c8775105f500a47141f53f30a009ccc8e9535cc517c'
            '971e113a49de65529b3b706ce8529c1c80f22b2828b9c2f4732b3363fb69fcbb'
            'bc78aedb7a63371bbefc2673a5444df4d8b5bdcd9bde2f4fc55b54a863c29eb9'
            '095c4e3d645a6717a055c72d7104d713cc0db1df2d8829dd9615d55118879247'
            '28d1471278fd623abec42ec672b0c9de61f8f0f84b44db1f180f3b1b034995c4'
            '22ed9d3c7aeee8fa77d20b781afc290642ed2eead396631370a92a2581e5c3e9'
            '33f47ba605bde24b5f5369bfa9575e06d507cc09db77bdefb06f873519cd011a'
            'c258d171686b4ab233af1a4d1b78e8615745e36fcdaed48f2e6e0de4ec814198'
            'b0fa20a235b7d5a2dc1c96c6966129366f549972e64228a20de6b362a367100d'
            '00a688658f24abdd5a788180d66043e460b02c9417a4588c5af404426fe1bb2c')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/icons"
}
