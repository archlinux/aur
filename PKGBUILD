# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.3.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Mocha'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Green.zip"
        "$pkgname-$pkgver-grey.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Grey.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Peach.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Pink.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Red.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Teal.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Yellow.zip"
        "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha.zip")
sha256sums=('9bfc1caba922128658c13ba1f77528e6bc9b8bedc2867513f9b52c076cfb5ffd'
            '5bd59158ed80b8f3cb048a4cb7f55d87765814957ef4a11465d466ab05782abe'
            '9a697e1ebec3e0db9cab302dfdbf999679e8e7b3a8027909196ad0f2559e6311'
            '9ce767175683af4d08c5a380881f8482d417ba2b79a2a76160e057bea32850e1'
            'ec36338cf32533ded2159ce5b29442a09d86f79f560bda47e0e8eb59cfff7022'
            '59dc6bf1e33e4d427bbc03b4cd55b010218abf1b5edbc90cc357e76182e6027d'
            '35223fddf3172e53905b6e4f13f68a78e016bda793ef1e057889e0029693dfe5'
            '8291dbd9e1f049ced38dc25c76d56873049c641527d3503f3ea56766e363df47')

package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -a --no-preserve=ownership \
		"Catppuccin-Mocha-Green-hdpi" \
		"Catppuccin-Mocha-Green-xhdpi" \
		"Catppuccin-Mocha-Green" \
		"Catppuccin-Mocha-Grey-hdpi" \
		"Catppuccin-Mocha-Grey-xhdpi" \
		"Catppuccin-Mocha-Grey" \
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
