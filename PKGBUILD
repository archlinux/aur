# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-latte
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('9af0ef9e3fcdb6268c44e81ce0afe28833232079c3b6dae1078a98262abd3c0a'
            '635d4dffa769978bc35876a8daea550483745a51caee5c1a29d47a92c721ce5e'
            'aaddf554b6127f8eab914ddd79ceb2fe1d6da28aa772f7d6eb89efef33f9ee01'
            '56fa92f27f6dc46c11f37c2db112c823055a9a8cc19a8b825b608125fa31472e'
            'a0e79b601b4d7538526db8c0325dbeb6b2a64bad35f60de59e3de4fffeba9b13'
            '30df67fcc6d47698b765d57b47a58d16d384cdd62bcfe4f85c140649f044d720'
            '15ecffab528e8bd0995dfab0a226861ecbbe0375cc9718bc628dcec0397029a6'
            '89b022135ee4436f762c02bd1821fab82e0b5b05a67cf5c3a11a507d8e138df5'
            '134b95a92e80786041b5d8802440f2a5cb0250b2c2c3d50f5dbf3fef0ebb329b'
            '741ea69fcb57081baae9c76f1889783fbb458137ddda6e41b1f50df1519f44ea'
            'fc00d358e3fa12fd31a502eb6060650d03af2aa94403bc3ad803e10cd58688fe'
            'feae82c2e2385713398684a292be5dde2d59c18756d445ddb78af51003a2d5d1'
            '2b96e3af9f18d61cae4e5baf5664c4394379191f5154fc7ee4da7037ae7d5b23'
            '9c142764e3cab889472cb8d32b4b66280452c551185d2589192f647ee39d50fe'
            'ca05b362be6f88a4c53c790191e717c73e650fecc07ad5116221ea180f5373b5'
            '96d96f8497bf77f14b0ce7d39b40cd300b43c3897e0564deeb19ef71a20b1ba6')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/icons"
}
