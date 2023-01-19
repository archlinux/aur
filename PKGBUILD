# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.4.1
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Mocha'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Blue-Dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Flamingo-Dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Green-Dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Lavender-Dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Maroon-Dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Mauve-Dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Peach-Dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Pink-Dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Red-Dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Rosewater-Dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Sapphire-Dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Sky-Dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Teal-Dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Yellow-Dark.zip")
sha256sums=('699f5516fd639f9af6552e7d1aa5287d22365c1b8e4e2027b822bb49bbf7cee4'
            '38a6ac4f02919f88957f2642507f206ed8082aa5fd8f8226365f5557e7a7915b'
            'd966a06ada481962e4063898879440016c7581bb87ff58bbf5650518570a228c'
            '95fec6fc99c10bd544fe8bb27361491add77c6efe6432e0ca5bbb9c10d4f92eb'
            'd3657305f428dec58d04c8a6d54570f86bb015031a7e421422b6bf56a44f8292'
            '1fe98272a56f37acd446de129f3ef6dc8e75c8198c873c96e7958fa410138cfb'
            '5eb8868182121fde830895bdbb39a886c43eb0c219e208f30b738ef0f557ab2d'
            '9d1566a59a03075358ec4fa692640b9f625e2e33d70f6afd292835cda4ed9bf9'
            '0b258ca0f4fb6894fe076765f95fbab916cc8e5e2ae5f0aaa8a64ed4933dfde8'
            '88d09ca25a692673deaaf99ca5738cfec6aa421599fe0a6b00f864cd5b4ef313'
            '0bc40803af000c2d2c05e7b32094627baa4f4b16b602c29c6b757bda79267882'
            '82d451ed77db47318a301a313ae4393a97782af7bea162d29040a35d7998f727'
            '196193da46ce7379e49ff9954f73dcf9d44498a760b0e7b216e4314f4114b27a'
            '489a4284798f074d89ffaee15945e51a3a2306088c71e2e56c0b0cb71d2084a0')

package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -a --no-preserve=ownership \
		"Catppuccin-Mocha-Standard-Blue-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Blue-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Blue-Dark" \
        "Catppuccin-Mocha-Standard-Flamingo-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Flamingo-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Flamingo-Dark" \
        "Catppuccin-Mocha-Standard-Green-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Green-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Green-Dark" \
        "Catppuccin-Mocha-Standard-Lavender-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Lavender-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Lavender-Dark" \
        "Catppuccin-Mocha-Standard-Maroon-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Maroon-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Maroon-Dark" \
        "Catppuccin-Mocha-Standard-Mauve-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Mauve-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Mauve-Dark" \
        "Catppuccin-Mocha-Standard-Peach-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Peach-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Peach-Dark" \
        "Catppuccin-Mocha-Standard-Pink-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Pink-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Pink-Dark" \
        "Catppuccin-Mocha-Standard-Red-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Red-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Red-Dark" \
        "Catppuccin-Mocha-Standard-Rosewater-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Rosewater-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Rosewater-Dark" \
        "Catppuccin-Mocha-Standard-Sapphire-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Sapphire-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Sapphire-Dark" \
        "Catppuccin-Mocha-Standard-Sky-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Sky-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Sky-Dark" \
        "Catppuccin-Mocha-Standard-Teal-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Teal-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Teal-Dark" \
        "Catppuccin-Mocha-Standard-Yellow-Dark-hdpi" \
        "Catppuccin-Mocha-Standard-Yellow-Dark-xhdpi" \
        "Catppuccin-Mocha-Standard-Yellow-Dark" \
		"$pkgdir/usr/share/themes"
}
