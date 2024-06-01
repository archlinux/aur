# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-mocha
pkgver=0.3.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('fcd12dc65662c1bb5d41e7ee105e28c9848da8dabfcb2f5ca6aa86c72807081f'
            'd98a8ad6f2f92bb304b6909db37911389da30ad8d6cf777dd20b6e1e9dff889c'
            '1be39cc8ffe31f6cb366d0a20696e79c8e40640243416480c80938a8477ceb99'
            '6d956af3dc035bd117a108d8870121a1668c3cbf3a10ac2a14727daa3633fe71'
            'eacff16878330efa33f6b58c8d467ac0104371d076f97027668c7e974f2e59f0'
            'fa2e50fbc1bdc20d8217d662adc6725f7d0b7899170687033197e53dc63dc8dc'
            '923315fbd1c1cd111eae3820309556d50fd0b120f3d637e77211baef8d46d979'
            '70f89a13799359603f8bf056f61afd7c96ca77391951a6c3705ac24496f7ca1c'
            '4ed4e2bd2895cc1496ef5bc510002f7601e62de7f32768eea4af01890196e3b9'
            '1d866561ad50beef1e3f9cc8c4defe546e47280801209757b9b378517141e2fa'
            '251f5849211797efed9dd2c973e0adf67176c73c18acb04cab33b332b2209232'
            'ea69b14dd6ddd8e1fe149f409b855d9d19ba9b5db168bbd404abe41380d4a86c'
            '8f752493013d88474d357101d3596472e3ecbbee08d92066fefa4bae226e906f'
            'b24f5233759125fa82cd8a412178d6a95082fdf320900922e4d1c216a17f3619'
            '3b4c69fa338eb7739d75c32b31e7793f2ac3cb850e2774f0fdd802098c6fb2c0'
            'bfc9706ad90da53f59faf7dc8a916cfbe5fb797317de18eb85c54207685830c5')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/icons"
}
