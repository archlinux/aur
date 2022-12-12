# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.4.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Macchiato'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Blue-Dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Flamingo-Dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Green-Dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Lavender-Dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Maroon-Dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Mauve-Dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Peach-Dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Pink-Dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Red-Dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Rosewater-Dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Sapphire-Dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Sky-Dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Teal-Dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Yellow-Dark.zip")

sha256sums=('d94485567d553ad935e01cfc7ebed6b1599594e82c2d9495c45a8b08dcae2604'
            '257a509d71b237b58cef683b98a67f7d78803d179af7af79258d4661da81c5d1'
            'a35082155e43d8966e8d9778bbde974ddbb7253205b0a490d9414b4a200da063'
            'dbd45007cd6513775be11c5125bdab93b2bc359e54ff972d65b5345f0b0d3b0d'
            'e30cb0bd50cf5a74b0be4c48e6c61dd0d290507b20c2c4e95723f0049888deb8'
            'b4981c749567ff61bc795fdfddc2f604b9361cdef10db1150ee17b14ebb9889e'
            'f97861f627092fa8b11b61fc930d572881b11ffa61bb9f21b1d2f2d24cc88a57'
            'bcb3b57764cfc33fa85f744f3d7be18fbeba1000b535e77bde460dcd92fdc154'
            '0b654a9a80b8c5283f4113a8292130254b64d758c25235531b940ba87f083b84'
            'd51500a87492d15e65186444dc8254ab91f983f57f47f67d91d0d8c2ad82158b'
            '28d87926e8cc49a99bbd7c186267f27ec9c8d604dfeb502118755d1ff84f1d75'
            '7c179baf0d03940750834996d5bbfba200dcdb1e97b7027bb220fb3890211978'
            '969a79d09172b706f51ac064cad2b28fe897914f55e8d74ec9a671ac38e7d2f7'
            'd1d906e799f1ee9ce63b574a124269a24dd4f2a1e5c932cbcc7cb0620afed997')
package() {
  install -d "$pkgdir/usr/share/themes/"
  cp -a --no-preserve=ownership \
      "Catppuccin-Macchiato-Standard-Blue-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Blue-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Blue-Dark" \
        "Catppuccin-Macchiato-Standard-Flamingo-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Flamingo-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Flamingo-Dark" \
        "Catppuccin-Macchiato-Standard-Green-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Green-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Green-Dark" \
        "Catppuccin-Macchiato-Standard-Lavender-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Lavender-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Lavender-Dark" \
        "Catppuccin-Macchiato-Standard-Maroon-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Maroon-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Maroon-Dark" \
        "Catppuccin-Macchiato-Standard-Mauve-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Mauve-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Mauve-Dark" \
        "Catppuccin-Macchiato-Standard-Peach-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Peach-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Peach-Dark" \
        "Catppuccin-Macchiato-Standard-Pink-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Pink-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Pink-Dark" \
        "Catppuccin-Macchiato-Standard-Red-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Red-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Red-Dark" \
        "Catppuccin-Macchiato-Standard-Rosewater-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Rosewater-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Rosewater-Dark" \
        "Catppuccin-Macchiato-Standard-Sapphire-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Sapphire-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Sapphire-Dark" \
        "Catppuccin-Macchiato-Standard-Sky-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Sky-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Sky-Dark" \
        "Catppuccin-Macchiato-Standard-Teal-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Teal-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Teal-Dark" \
        "Catppuccin-Macchiato-Standard-Yellow-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Yellow-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Yellow-Dark" \
      "$pkgdir/usr/share/themes"
}
