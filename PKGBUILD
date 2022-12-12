# Maintainer: spookyintheam <spookyintheam@protonmail.com> 
# Contributor: Luis Martinez <luis dot martinez dot at disroot dot org>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.4.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Blue-Dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Flamingo-Dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Green-Dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Lavender-Dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Maroon-Dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Mauve-Dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Peach-Dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Pink-Dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Red-Dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Rosewater-Dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sapphire-Dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sky-Dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Teal-Dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Yellow-Dark.zip")

sha256sums=('da5110beb25f43779391fc4a3cfbb96cf6a94256e65376810b20b9d579f09a27'
            'b63764575014e3c076e0d8b0ff2b0d72497c2c7bf5f385d2410b4a5525ca5db8'
            'd055c429c7e5abc26118d5d27e4e4176b5d1ef62ac84820ba723c5dd487332b1'
            'b56510b149f03db0c189725aadeced4dff14150fa224f0b4d84447058f0fbe83'
            '875de2fe7058d762c5d345d1508dd2a82dac5adf529d25ed6b1975f160b76687'
            'f0a89d9c30b12fc02c2b0555b127065591a22bd0d9616736547c2c194f731bff'
            'd1102891f0cc09d2a600d81d9b12c8cc3ecad1ae6d455d6c3c1ef17a69a1397d'
            'e8f88f03815aeb2745c05380ed335c6b115b46446043ddc8f4abc43d877a5db3'
            '04d785882e44ae86b7a88e6c47f4413e33e670afadcf1e730e0cbde4c4a6400c'
            '7e71fd65b4f7a93cd34bbad245b65072fac4aa93a3cd6a285acb08c8c6e9ef54'
            '99331587dbb62f01e555823a69630dea0b4a5e87b08e09d8a9988c96bab75382'
            '28b28aa60b13a89d4503efb91c56f8bb751399ab3eaf550429052f142ab7ea48'
            '22a7b0b81968a7932d028baeaf49960f814c26f75180bdcecd8108ebed48cf1f'
            '87cf1c13def0e7820d6f40d615977b35870e1c56eeb5b47ec2d69e9f09697541')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Frappe-Standard-Blue-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Blue-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Blue-Dark" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark" \
        "Catppuccin-Frappe-Standard-Green-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Green-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Green-Dark" \
        "Catppuccin-Frappe-Standard-Lavender-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Lavender-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Lavender-Dark" \
        "Catppuccin-Frappe-Standard-Maroon-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Maroon-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Maroon-Dark" \
        "Catppuccin-Frappe-Standard-Mauve-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Mauve-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Mauve-Dark" \
        "Catppuccin-Frappe-Standard-Peach-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Peach-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Peach-Dark" \
        "Catppuccin-Frappe-Standard-Pink-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Pink-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Pink-Dark" \
        "Catppuccin-Frappe-Standard-Red-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Red-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Red-Dark" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark" \
        "Catppuccin-Frappe-Standard-Sky-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sky-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sky-Dark" \
        "Catppuccin-Frappe-Standard-Teal-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Teal-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Teal-Dark" \
        "Catppuccin-Frappe-Standard-Yellow-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Yellow-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Yellow-Dark" \
                "$pkgdir/usr/share/themes"
}
