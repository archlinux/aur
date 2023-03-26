# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.4.3
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
sha256sums=('598f2210b1f744acaea4cda7c80eb8a8162026f801f4f3f02c2d8947de9b6f6e'
            '2ac5b4921f360b60215765d2c2a3f33d98b2fff99131532c98cb35bce722b4a6'
            '427ba36002bd75ea2cbe3bafdfd781527cadbe057e7d25e5a06a78956fed622c'
            '4728a3ed5f51098996fe21b37156c6f4e3ef2f58e46e781e17bc9f093086120a'
            'a4b00ff7dfd893da4b481e24238eac97dc43d8814be90b9245a14e2d743995cb'
            '3c822aeba641d1b9c7b4fa67db75b8556eff42c0ab515120412eabc332ed3967'
            'bd1b5bd9e8dcbd8483efbf97ac4785c3bef6a76de1104dd65af2bef233134d55'
            '31159a9d30b0697b5055398380546e89ef49250b09c29c73d01fdc978b9bf7b2'
            '4f4052c86e44ea070eba8b9d2d7525d50ae9aed6919cce7abbff6aa1dbd3acbf'
            '9c083f4b9c9ea9b0f7241301599547280db29c485d69409b586bdacfe4d0ee57'
            'e4c59beaeaf854dce927ec7c752438c4086a47ade7bcb7bccd4ea717e5a0c29e'
            '6a057a2444b58d7db45a9818dede3b9edfeb56168c33cd4e062608200968e41b'
            '989dbcda385900531cc4c44ef6b073d0dd593e70841050abedb8d9bd81403182'
            '89f996ca883da12a9c80ae8c966f24914dc34c920d1a7977732e9c652e0809c6')

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
