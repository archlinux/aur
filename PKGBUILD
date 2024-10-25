# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-frappe
pkgver=1.0.1 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('eb5e8dd574a259e972ef5fc3b5552f6cfedf44b71a3fab63cc04278a31db7d92'
            '4547bfd8ea0e246e94039ce8fd5af1aa5734d75fa38bcdc3bb1d72abd152b74e'
            '0ccd971e8039f7526d7d4fc772a461ea6e5e1ae9dc57c2f568b947823cd76e1f'
            'cd5ff9ed75bc773133d56e4a95b183a56ea8d589173a0d11fea5cadc98b621c4'
            '8da97c6d28bc430f0abd97763b7bffa9a1c0323ddc00fbd168dea68b0dba59d0'
            '90b7675c03717533e0a46d26921cf0a7cdd5049d091648cae0d57056e78a1b62'
            'e476d8f4565ea12722ef23ca67724d5e8f928acb9fdd153bb98922d767707282'
            '9cd0b37d5b5522116af3dbf61bad81326f857e535cc31d1411214b706f618fc1'
            '2ec864ab1523735288d87f058824071b34f0ca731254acf8ed90125f79e17e31'
            '402bc7432b0807e108daddafe7e2ad2f16d49576ad454084f7e92c6efbe61a63'
            '86e79934277b2c7fe5fc26be07fb6b58fb271ce5bfcd1429622c0b5acc228a88'
            '4cad48c2bb8f9237038969ed58ce1b90e97289243cfdcc598f4c7dd167a2f2e7'
            '6a8f38d48ab8965b29832de97bebeb95fb66a0fa0bb171db1e76c18aeb94e650'
            'ab64348bcd9247d4d00e042f51cb21ac16c641466e3042b85863ac7617402b40'
            'dbdadb47a729047cacf74f5e9407a5882b84558989c9a0d2f0a5ba3e2d7944c1'
            '881ddeef4191f23954c55b172c77569eba9cba9d1d7de964c4b19ae7ab3678fe')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/icons"
}
