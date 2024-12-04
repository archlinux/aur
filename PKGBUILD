# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-frappe
pkgver=1.0.2 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('d0645bf4c575cd226c40f5ff8f49146eadaf0d6c8908c657ae9adf8f8b0a2898'
            'deda556cab766e49e6f6a02dcbb02cb3a5106da58b5de08239bae8ff890ff8c5'
            '06eb0d0aa0206b0c48849da454959cde4193cc355a79ea0b5cd0782e9718e1bc'
            '1af537a3e9fba0e8a2354a47dbe08ebe7d657d106a22cea268ba7b9308d4b132'
            '17f6d77027b95279cdd61ae7083d688d455bc2ed445ff65336470648d6713f3f'
            'fb5ab0e4c0fe377327bb7ee20c96539670e1cbccc8c02d8c9ead423746e3823e'
            '84793e47bdc4d062e275c0f28040327b365addfa54cc5bc11270f784d36a1aaa'
            '00ffa0260cd9c356c081859b653b6c06322b73fc1c13e8af21c515ef0c926f16'
            '026ac43a8e33b27da07712a35aecf7c5a675e3922d151d7c59c99e5239ae15c0'
            '21a35b4a7ce04a857bb5067c2c1129f1b95dd61f420e612e57b1660c355d55c6'
            '3fef10d511d5164d94e5a7e034ddf3be22b18485088b97b143751bc2be4b5d8e'
            'e14fdd4493c26bd672f7b50b0feb15a871d42002f85b57e1627c6d873dcc0607'
            '0766b38ab84ee2caaa9099fb0f3ae4eaefe9e9f7bae719a0466ac49270c42b65'
            '30415eaa27564a781861279036518770532f791aa5cd692df5011cabd0ad1622'
            '7b13566aa11e7e32ae198811eec7c8b97075d3f19d65da305a42e4ad87894e96'
            '35140ff2c1a7db8646313c8fac07a83d89866047657da09a8c89061d892a30a7')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/icons"
}
