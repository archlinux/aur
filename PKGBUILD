# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.3.1
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Mocha'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Blue.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Flamingo.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Green.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Lavender.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Maroon.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Mauve.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Peach.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Pink.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Red.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Rosewater.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Sapphire.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Sky.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Teal.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Yellow.zip")
sha256sums=('fc65a4b990413f5edc2e0445ed95df3695570b23f6515bd746f7c10a4fe4bdd2'
            'b29d4bbacde07ab0a9654b419413c5741ac3c031bbd1b2c623f7c40ce6e2f9c7'
            'ae775163cc8061ab80ab0405289763b06172fccd7c802e8d114132e8b5166275'
            '1cb928a14cca44d4bc7b0511014e6a5172272846edf8f0d366a9c486d4a16f07'
            'ff10c42dd5341fda5f22eeba175d4447ed7a4d78de16faf5b3645822973223e1'
            'e0cfb4bab4585ac7745ace3d26a077d7397a7cab81b406d1cab63d1f4b866b4b'
            '74810bb353c889d4ab625e3967b4a1bfcc78893083e164e52e71aafa556f0a15'
            '34793c66476731855db73a2936582d9e9888b44589eaace6287248aee4e17925'
            '952d62ee2bf71d6e6d8ba83b369ab339b986c1b405093b3a49335639cf6ed570'
            '1ca968ec0cd751e36550916979305460c7ac16f9276954a34f2e938dab9507b6'
            '076f9bf813d3899d77becf841a70af7de0b0dff4ac6d98a05d65a90942db8267'
            'a0042a3c5605fc9940f18aa47efc9112ff271df6b678422058ef5bf1bfb80e4b'
            '35b6a16872b688540dd84ddf3ad94d7c5cb2dead2ed8a9714bf444adf253dd7d'
            '47eb5220ed35784982fa2ddda268d882649147e1bfa883a36f1e321e21d08d73')

package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -a --no-preserve=ownership \
		"Catppuccin-Mocha-Standard-Blue-hdpi" \
        "Catppuccin-Mocha-Standard-Blue-xhdpi" \
        "Catppuccin-Mocha-Standard-Blue" \
        "Catppuccin-Mocha-Standard-Flamingo-hdpi" \
        "Catppuccin-Mocha-Standard-Flamingo-xhdpi" \
        "Catppuccin-Mocha-Standard-Flamingo" \
        "Catppuccin-Mocha-Standard-Green-hdpi" \
        "Catppuccin-Mocha-Standard-Green-xhdpi" \
        "Catppuccin-Mocha-Standard-Green" \
        "Catppuccin-Mocha-Standard-Lavender-hdpi" \
        "Catppuccin-Mocha-Standard-Lavender-xhdpi" \
        "Catppuccin-Mocha-Standard-Lavender" \
        "Catppuccin-Mocha-Standard-Maroon-hdpi" \
        "Catppuccin-Mocha-Standard-Maroon-xhdpi" \
        "Catppuccin-Mocha-Standard-Maroon" \
        "Catppuccin-Mocha-Standard-Mauve-hdpi" \
        "Catppuccin-Mocha-Standard-Mauve-xhdpi" \
        "Catppuccin-Mocha-Standard-Mauve" \
        "Catppuccin-Mocha-Standard-Peach-hdpi" \
        "Catppuccin-Mocha-Standard-Peach-xhdpi" \
        "Catppuccin-Mocha-Standard-Peach" \
        "Catppuccin-Mocha-Standard-Pink-hdpi" \
        "Catppuccin-Mocha-Standard-Pink-xhdpi" \
        "Catppuccin-Mocha-Standard-Pink" \
        "Catppuccin-Mocha-Standard-Red-hdpi" \
        "Catppuccin-Mocha-Standard-Red-xhdpi" \
        "Catppuccin-Mocha-Standard-Red" \
        "Catppuccin-Mocha-Standard-Rosewater-hdpi" \
        "Catppuccin-Mocha-Standard-Rosewater-xhdpi" \
        "Catppuccin-Mocha-Standard-Rosewater" \
        "Catppuccin-Mocha-Standard-Sapphire-hdpi" \
        "Catppuccin-Mocha-Standard-Sapphire-xhdpi" \
        "Catppuccin-Mocha-Standard-Sapphire" \
        "Catppuccin-Mocha-Standard-Sky-hdpi" \
        "Catppuccin-Mocha-Standard-Sky-xhdpi" \
        "Catppuccin-Mocha-Standard-Sky" \
        "Catppuccin-Mocha-Standard-Teal-hdpi" \
        "Catppuccin-Mocha-Standard-Teal-xhdpi" \
        "Catppuccin-Mocha-Standard-Teal" \
        "Catppuccin-Mocha-Standard-Yellow-hdpi" \
        "Catppuccin-Mocha-Standard-Yellow-xhdpi" \
        "Catppuccin-Mocha-Standard-Yellow" \
		"$pkgdir/usr/share/themes"
}
