# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-frappe
pkgver=1.1.2 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Frappe'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-frappe-blue-sddm.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-frappe-flamingo-sddm.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-frappe-green-sddm.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-frappe-lavender-sddm.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-frappe-maroon-sddm.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-frappe-mauve-sddm.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-frappe-peach-sddm.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-frappe-pink-sddm.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-frappe-red-sddm.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-frappe-rosewater-sddm.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sapphire-sddm.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sky-sddm.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-frappe-teal-sddm.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-frappe-yellow-sddm.zip"
)
sha256sums=('9b2edfec0441bf32b9a0c404add4581ed1b11133a55e1fe694f49eb4db9cf9a6'
            '8075c4687fef645d667a27a1a8be7031c918064242e78935634dfa9fbeef4187'
            '3663b01f2eb8de34c9ea01b09491257dc8537ee9045e59b90eb227f9027c0ab9'
            '3e740aa6ccc6b04667aeeb79297b99eb03d13dbd58cb25cd5fabaad65cc33f8a'
            '9840567fe408a114884da48aea963effdae38165eab73a7b854e2c7484cfd6bd'
            'ce14f25b274efe1b2c1a017207152fa1fdecea1b879ea1d45ac1ce61fa52e9a8'
            '7b3196efde6dda7cef3c145c6efd70d57836164f5b0ddf2a579d2212969791c6'
            '51bca737ebf590335d02d9aa1aa8381a02b4a68eb126efe4d9a5ba0c0ed00abd'
            '7610d02a00ba322763d4c71d19160fbe455a05c3de172d620a3a4d70e3227d13'
            '86d98ce3fc897d2362cef084ab267a360468cebd948823e9b34b7945a3425832'
            '8f4a34f232a505cc7567dacbb4ca263314a12ea62e181f5a0a554b61b8f69f22'
            '554eb85a1eceecb15f78bf7e7743d13589e5533eae4e479566009eb9dcb19fa2'
            'f671078e4dfeffb2d4ae1881799054fb1c34eb6aa048daf5b9278f7349da3632'
            '775e804014f8e7eae19485cbd5b7a347523a18abb7a1d5cad14bb0a4ce532cf7')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/sddm/themes"
}
