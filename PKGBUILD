# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-latte
pkgver=0.3.1 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('0a9c92c95f089aaf16aa21aad28d52e47e986f436f633db2eb60c95fbfeee9f1'
            '54f6c8dbc693379a568e966f8a52567ab97478bd6353726c846c68aa628c701f'
            '0dd780943abbeb1dd04a6c0927fe4a9ef157de471ce68e6c9812d0c73dc95940'
            'c3273927385e6b9615c973efff6767967f784f385216434e75e1b5c2945351b6'
            'eaa360dd8b49278e8f14911a5bfdeca4c3a99f52220b7ec8b66afb3fe111d94b'
            '45550f043c046bf75ea7a8d54ffb15fa261d83cd3d9198432999b16660afc77d'
            'a2f6f474a016f829b7a3c9cc6cfd2a13f7aaf423d909bdb6b42ed8bea944e750'
            'bba45bbc825f89933eb89e8f49e7cbb9d7a6d7906c6450f49477d0f39623a36a'
            '819146b488b314cf5ee0265419fbcd1a7382872a1986c64c6a2ee30bcc9c20c7'
            '32778c7b1ba3bd044769ca71a1ec626564ff4d0d100dc54d5e97560273ba9d2f'
            'c2a25fce6584c2168addc58d45094bdc177e8c26fec57c8af19170878832feb7'
            '44bf503beb9513cb8fa6e0f867ac9890b905024d91c66a99c4c3a33705a0a5f4'
            'd0b6308e14668659b7c9a80653a9689793eb878352ba3a16b8ab03c406cf184f'
            'a4d0d662274511f8f607ce49b03e8cb4850e48271f1e616161d96102d101b747'
            '2052d2519028ed457a221f02de6f2cfd3bba066e11b20141225c04c75777269b'
            '29844ffc792e8b205001ab6bcd8c857e8ca429b7111ee6d23c5881106a605836')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/icons"
}
