# Maintainer: spookyintheam <spookyintheam@protonmail.com> 
# Contributor: Luis Martinez <luis dot martinez dot at disroot dot org>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.3.1
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Blue.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Flamingo.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Green.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Lavender.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Maroon.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Mauve.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Peach.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Pink.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Red.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Rosewater.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sapphire.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sky.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Teal.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Yellow.zip")

sha256sums=('2e876c40154373e629299c80f52e311333974ec7fd472154441a16d23bd5f642'
            'da1fb2313c379b85bcaabd5414225c494c58646cf63ae98a54300add05b1e7e2'
            '1b0d64523141c1bd4a8457a508154c514a390646568f1f17031c743c48c365bf'
            '5d1d42835e58f8aada31f5da52711c4673a1751ca0a77b684c9ccbacd653c108'
            'fcdd88dbbe6a133585203f90deb65473d2f18b023079cfae25707f57d248e00d'
            'dbaec5637a3889282b49d56274246eeea2ec1a8283b91afe72ca695e59598e38'
            'aeeca849b2eb747665831826d9a7745863a3a49f0a7b86e9d00c1caa543ef9dc'
            'b69cb931441ac34f076fbf12443c4090609a028a9d1cd1fb1eb7ef429503eaf3'
            '31c96aefb9bc0505cdd846e1ee1b7d1b2fd4194fde1c2268ca1638cfd763ba0f'
            'a263e8b61ca5692fda5daa19ddb394e3f126066c3f11c668e34b057d2dbbb180'
            '9bc80cbc902be2b203f1b15d3caac6382e0b6974b91d108910fe497254ec7245'
            'b34383c8e2171d49e6b5eb5c897c3374cb6bda5176c1e4108fa53a4878ab3848'
            'a0f8a5bee6c0d9fb6637d65d47b5ec65638bc17aeadc214b776e194aee3e3161'
            '7c418679c08120bfb589b76d4184f8906b48f1b2a70e1afbfde638b367fe8076')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Frappe-Standard-Blue-hdpi" \
        "Catppuccin-Frappe-Standard-Blue-xhdpi" \
        "Catppuccin-Frappe-Standard-Blue" \
        "Catppuccin-Frappe-Standard-Flamingo-hdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-xhdpi" \
        "Catppuccin-Frappe-Standard-Flamingo" \
        "Catppuccin-Frappe-Standard-Green-hdpi" \
        "Catppuccin-Frappe-Standard-Green-xhdpi" \
        "Catppuccin-Frappe-Standard-Green" \
        "Catppuccin-Frappe-Standard-Lavender-hdpi" \
        "Catppuccin-Frappe-Standard-Lavender-xhdpi" \
        "Catppuccin-Frappe-Standard-Lavender" \
        "Catppuccin-Frappe-Standard-Maroon-hdpi" \
        "Catppuccin-Frappe-Standard-Maroon-xhdpi" \
        "Catppuccin-Frappe-Standard-Maroon" \
        "Catppuccin-Frappe-Standard-Mauve-hdpi" \
        "Catppuccin-Frappe-Standard-Mauve-xhdpi" \
        "Catppuccin-Frappe-Standard-Mauve" \
        "Catppuccin-Frappe-Standard-Peach-hdpi" \
        "Catppuccin-Frappe-Standard-Peach-xhdpi" \
        "Catppuccin-Frappe-Standard-Peach" \
        "Catppuccin-Frappe-Standard-Pink-hdpi" \
        "Catppuccin-Frappe-Standard-Pink-xhdpi" \
        "Catppuccin-Frappe-Standard-Pink" \
        "Catppuccin-Frappe-Standard-Red-hdpi" \
        "Catppuccin-Frappe-Standard-Red-xhdpi" \
        "Catppuccin-Frappe-Standard-Red" \
        "Catppuccin-Frappe-Standard-Rosewater-hdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-xhdpi" \
        "Catppuccin-Frappe-Standard-Rosewater" \
        "Catppuccin-Frappe-Standard-Sapphire-hdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-xhdpi" \
        "Catppuccin-Frappe-Standard-Sapphire" \
        "Catppuccin-Frappe-Standard-Sky-hdpi" \
        "Catppuccin-Frappe-Standard-Sky-xhdpi" \
        "Catppuccin-Frappe-Standard-Sky" \
        "Catppuccin-Frappe-Standard-Teal-hdpi" \
        "Catppuccin-Frappe-Standard-Teal-xhdpi" \
        "Catppuccin-Frappe-Standard-Teal" \
        "Catppuccin-Frappe-Standard-Yellow-hdpi" \
        "Catppuccin-Frappe-Standard-Yellow-xhdpi" \
        "Catppuccin-Frappe-Standard-Yellow" \
                "$pkgdir/usr/share/themes"
}
