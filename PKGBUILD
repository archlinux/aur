# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.2.7
pkgrel=3
pkgdesc='Soothing pastel theme for GTK3 - Mocha'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Green.zip"
        "$pkgname-$pkgver-grey.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Grey.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Lavender.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Mauve.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Peach.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Pink.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Red.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Teal.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha-Yellow.zip"
        "$pkgname-$pkgver.zip::$url/releases/download/v-0.2.7/Catppuccin-Mocha.zip")
sha256sums=('ed483f93b8995bfa2ec4ea148c2e7274edc23247a6aa19c8e87a2d58abd4dd4a'
            'd27f252c3a85d98261a6bd1bb64908a08b2cb9cfd9886c53de40ff177391514b'
            '62379ef4e40dffc0cc6ad5e470777f1bf9b4d36b9bc24bcb273191f95e3afeef'
            '202a0fbba598024b8dad4c5e5323da91a0a4547bf5eae2f786daf17ac6e35114'
            '9c8b505d8b172c9de2a600473acd47eb521fc371d82a5f3de5083162d5e15c9d'
            '4e73eddd807317048bd2a2622a68bff2f0b0c176d692b39f135e022d09bc52a0'
            '850c6e3d36c942ccd7177da621352569a649073f6835250ccf026adfde6ba7e9'
            '177b7522934827f3954bcfe948d67015ef825412c5463d000cadf40e614a7ad5'
            '59683ce6d958b74513a41b827015e30685c30d692db857c0bb99d99df04d2a64'
            '09791c8a428a66e7af7a9d032e1efb530b7e3c28578997d93b4288711b945a0c')

package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -a --no-preserve=ownership \
		"Catppuccin-Mocha-Green-hdpi" \
		"Catppuccin-Mocha-Green-xhdpi" \
		"Catppuccin-Mocha-Green" \
		"Catppuccin-Mocha-Grey-hdpi" \
		"Catppuccin-Mocha-Grey-xhdpi" \
		"Catppuccin-Mocha-Grey" \
    "Catppuccin-Mocha-Lavender-hdpi" \
    "Catppuccin-Mocha-Lavender-xhdpi" \
    "Catppuccin-Mocha-Lavender" \
		"Catppuccin-Mocha-Mauve-hdpi" \
		"Catppuccin-Mocha-Mauve-xhdpi" \
		"Catppuccin-Mocha-Mauve" \
    "Catppuccin-Mocha-Peach-hdpi" \
    "Catppuccin-Mocha-Peach-xhdpi" \
    "Catppuccin-Mocha-Peach" \
		"Catppuccin-Mocha-Pink-hdpi" \
		"Catppuccin-Mocha-Pink-xhdpi" \
		"Catppuccin-Mocha-Pink" \
		"Catppuccin-Mocha-Red-hdpi" \
		"Catppuccin-Mocha-Red-xhdpi" \
		"Catppuccin-Mocha-Red" \
		"Catppuccin-Mocha-Teal-hdpi" \
		"Catppuccin-Mocha-Teal-xhdpi" \
		"Catppuccin-Mocha-Teal" \
		"Catppuccin-Mocha-Yellow-hdpi" \
		"Catppuccin-Mocha-Yellow-xhdpi" \
		"Catppuccin-Mocha-Yellow" \
    "Catppuccin-Mocha-hdpi" \
    "Catppuccin-Mocha-xhdpi" \
		"Catppuccin-Mocha" \
		"$pkgdir/usr/share/themes"
}
