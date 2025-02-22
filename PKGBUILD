# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-frappe
pkgver=2.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('6133983b33e07b3dc50b3a833a2a2f9fb45af4fb16b39ad13c8b78381f7c9e9c'
            'a3eaea75b6c8fd6908716b5e8bc769da581f2246a39a7d1a1f9d5c1ee4d72608'
            '57890702ffc137e88efc18ba5c53a6a40b4b096b346cbcbc35c34a532bc78382'
            '5df660a8e6758ec0d6834c02ee196d3c6be20b1396c9e5ca21bccc8a1650f0ad'
            '291623213f96a1b2bfabb5314d6136ab3807793621438b141aaf9a22e5ac919f'
            'c0df379cb2413c38451b0f990a42879489ef85dac2e108498802f7032d2bfd7e'
            'c0f2d4e1191eb4b09a7667b3d7932a0c5fb01b69c730d6a35866f669a4d5f99a'
            'f901e7e6cdd95ff4d9990373f96208527ef1d9fc8f864004d634c2b8723b1e73'
            '623bddd35efc2c8aa4ef69df81bb4360a464bdd5b54d418416ddf5817eceb762'
            'ebf5272b4bfadf65cd2330a0cad30797ca222f216ba88282867a0e2cf458f85e'
            'e1f743b315e5dbd71d410f9b4274d148acfe5591b7532be951cfa67b0e6caa95'
            '93d9e8d9625e732e95890f48ba2635e446dd1d9fe01277c40c0c7fc15809ddea'
            '9aad5b714cacfaf397d325f909fe1b628c6d2f9a592e54480bb65f68b8ce2cd8'
            '4a2dd61441ebf8d746623521334680af58a5896b812d455fd2e8a6a94a9663d5'
            '07b3fb248bebbfbfabc1259d4b318739b3adf25696eb76dd7302616d32de76c0'
            '164c8e8c19e7e296be808a5b3cf89d0bb3cf100e5739ffd41a98539f6777b4de')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/icons"
}
