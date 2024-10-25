# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-macchiato
pkgver=1.0.1 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Macchiato'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-cursors.zip"
)

sha256sums=('7d074b4cad6a4e9a584a5ee00d541f38cb62943ac312cb14d4e99c55a8578f12'
            '12a525876bfe3cf6cc74079f257edbc69e9c6bf720a67eed96428e29bfb6da33'
            '4959d659cef7d337c514a914837e8b66b70ce69ad863451060a25d1dc291b1be'
            '8e0381d8639b9f56da9ced108c1cef52c6b218dd662a7613e00e55accd24705d'
            '57ba4c04eecdd57592e5da7950ac2229302bf703d2bb1e95de17d6b51dd2f66e'
            'c0faf57cfaad481df7091a6304cfe34076c634c1257a0692d661f076501033f8'
            'fc04b33d53e63d012273950f1bc28569119d9aa7b9bb1c30a917ebac0a98c11d'
            '5cd068295c9c1eacdc6eb9156679bb816b32dcc4a61aa3d2ac3e6c76b4166900'
            'ba9eadcf3ecc54d8e33c50308e63528f36d4ea0537c5a8a4b94366c56c4d9880'
            '468dc5f324703bb4f6cb3ef52e8c3a53e0f0118e3869f93f2d69b936987ad186'
            '7c618256b2ff8f0710ff772f6a437b69011624aaf7a7fb6f9db1316c131dab68'
            '6e6667b76435106071cc9af9163191f8ec70f1462b12ff3b2d1d86bf9baf3cb4'
            '9cab6e669ecdba1842df4027b256b946177bc53ea97c95059a16be1197677adb'
            'd7179a86e84c4d7f1cba202bdf46a36aef8ff62053d20cb16bfadafc8b39e785'
            'ed3404930840388f736b12269dfb98667c4fcd50425d05ee713a4f72cd5e8d13'
            '9ba4b3e7d5a4446796a02dfb9916e997280147ad6d2a78043ecde7d1abd31289')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/icons"
}
