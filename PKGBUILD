# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-frappe
pkgver=0.4.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('52221bf909c6d614ac67d4ab67ee2c0742af43f22a225cb4b4026fc2a932a7c4'
            '6d4b5cee77aab9b8cff4172eb590b800380e9414ac09f374659fb6497a8e2334'
            '55fbc6564b87d0892e7a2031e7aaac2bc71936cca6936cdd25a8c79c96935f71'
            '2524008a02cbc16de61517c04835c515eb8683112da04600b0a4cbf0581b4431'
            '0f2eff187534493b6e940b6dc732c899bc4dfa87bffc5b431c7330f668403d57'
            '485d1238076da7e86e0c1baac34518a328984b978a8d59d4f01419a9e1f5b4fc'
            '8acbd7955a3cead72ee61b83a8ac0c0caa28853af21731d15c736068df675209'
            '6a5b5729a3c61315b7e6188cb9c64a4ef1611aa755f75cd7d82f620c8e706c47'
            'cc9cf4352aedca00d220543d78e65be12a6544cb6143f6a01482c249e1ac307f'
            'd730381ee44ac87e792062dce86279a6306f4fa991a5a3bcb3a7744a566a947a'
            '6c60fbdff7ccc3fa51fa70d1af575781d16f5c420c03543f78c7dc0a967efe42'
            '254e1817fc5d4b92c3576ad894ddb1587ab11839524b5e26ce3ae90644b1ca0a'
            'e1a0f2c8f74786c57c7b4347d1b38bc81d0b7bfbe4fb60577dc69717db5c7cfd'
            'ad70a53adca1d40c4fa1719d3b137168181e445bb6a2adf5ba98bbd3d478176d'
            'e2196f50cd109f781ba767dbf2578dfe61a0848daa778b6c8e5473f90216426b'
            '63928694c7e0a862b96e1a885c614a5d02a18cf3ab926ed4f77dec3355c182db')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/icons"
}
