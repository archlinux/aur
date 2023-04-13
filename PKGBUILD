# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.5.0
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
sha256sums=('43c3e7c55f3f57ea6c75045818513c2058437360d7eb1b323436e3a631b34cbb'
            'd4063c493435a21c0975b55a93b09f480955398e5503fb4fc407bcd347df4992'
            '695c2f4530609607790613a1b7f51ba586663ab43200a1d777086b28a622fa15'
            '579c36c3e57137820e453c19699467e51facc118f20388a0faefeb55dc025dc8'
            '62eb910f16f9cb3391552f4a2ea218f46247166de1685cf3ff0ed4de78a66d9f'
            'c7b0394d3a1e57eb6879fd126f50a73a6fee572c73a82eabc1679dc2d128e90d'
            '0687f32ec41d9710234d37a62131dedae0213b62a48354e727c918bd22fd00fb'
            '58781d1780c02b47afe3303f7a0987927efa5eed065c3c2f5d64d4e480bef204'
            '0dad8a6b158e06b87f9d7a383c06c8a06c0b166db8b177220f1651f812856f87'
            'ae2991c298adf5ebe92f399b03c3387517d830f9348c845c35cfd3eb209b22da'
            'e97f216e3d18bbee0db32218309668ed3c8de66eaeedf5a4608a05edf19e89d0'
            'a566b196fda51967884233054fde064c0621d35af2faf77d8ae0bc76cc5ae853'
            '19647b7fd014546edc5f453e29eb8adc5cba5c962dff24cff04e09c603866093'
            'e420e655b0a7706bdb9982c466e2484918881c5e611aaa8a9f14924a138d3bb6')

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
