# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.4.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Mocha'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
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
sha256sums=('a8111aed41706e558f743c6eb5dc62149459f28029ee9d20cfccbdd7b5cd2054'
            'eb5a1068298a994d6bc09ccb5cf43ef47943a2b6e36490fffc68634330501991'
            '9895db096af8b47d9ced9539b5864e1a2fe793d04e0cfb40538ff9789c8a8666'
            '758b0a9710afaa4b346c22dd0f4861b394a9955f89dba34e8eaca535a3d7974c'
            'd1300060b68fd8a537451076ec407c0a073c3ebb1230b10f5768ac506348ce3a'
            'f772d2f501bf532d1b9ec152638e274e0c905d4aff16dd74237ebd883ff26c12'
            '833aea1425957155d78a0512d6838edfed11161bc8fa4aa0ec0d5efdd90aeff0'
            '6e5aa019a3c938c6651859421b850540e935a95d81696c87d82ab72afc74ee5c'
            'b6cb5a12b3bc9f17b90c09b63788b5d7c1e5a0c3fd5907317e2d105e8b2336f7'
            '2c9749fe8b14812bdb9ac7cc3fe720b8e610b0de894dad51124df18f8d198ed2'
            '5284e6353d9b6b973673e34ed19023cdc3d6296d8881c260ce0181e1b52bd68d'
            'b67bbfca6dad9e987b55739c6cd112701ee74e924b9d37dd4678a0ba21b38ff9'
            '41c5301f548ac41026f64bc743ef375296092e3ba2c1bdc3f3a3b9c715f5fb24'
            'a5c5b586d3b52281e5fafa6cf9fc8591845ae4f8cfdf124040d4cad4db8593d6')

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
