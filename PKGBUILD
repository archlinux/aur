# Maintainer: spookyintheam <spookyintheam@protonmail.com> 
# Contributor: Luis Martinez <luis dot martinez dot at disroot dot org>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.5.0
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

sha256sums=('992e959b44f608ba9fb1d053ca458b28e8f5a245cf3a4666d13bdbf0eca6c2fa'
            'e58fe755bc5f98df1f5d31e58f03bbd2ebc3a8be940b7dfa2d668149166762ad'
            '4fd5944db2c920ca921973ba583302c95dac6012f6731827913d0fb891ce7f14'
            'b4fe0810f8237a6e3d87962c37a3ac2a81d1b1413a5893fddf1f70907e744525'
            '2805769a2b3bd0baa3fa960d915495f262799640713b2eaa38b0e2eab70dd624'
            '1f8e4e3bdfad5ce7eec31d461d8be76c2eac30e3498cb310fcc8ec5a1b596eaf'
            '6e076f03ee968d6672b12202ccecba7e61f57e484f5603d0ae73ccc92515d8ff'
            '03c3c0b7c41be90d9dee455b4cb705115ee0145e41428ed9adaf0030539cdcdc'
            '553ffaf92d97288a8965f1752fe6a34e919cf35a31c5f4cedb1619d247d58d3a'
            '31bfddb6cc6855a0a39ff2c79700f0e9e25d76e91b3b70af285a8638d1071b53'
            '8f5d11a853c9ec395e35db6a2aafa2ed3839a55aadfdc360c042dae87b569ee7'
            'a77e54c871658eddb079d8d5b3e244b3ab92c52e544cc4a7e3dde08b20110998'
            '50c74ea04fad9fc9d17ec32e25bfea26c126521d9e20abc957f620fb05777969'
            '5af846caeff692f373401fe693cb371bc0d65eb0f898fdd26ea3694dd84924a5')
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
