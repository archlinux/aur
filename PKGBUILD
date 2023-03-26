# Maintainer: spookyintheam <spookyintheam@protonmail.com> 
# Contributor: Luis Martinez <luis dot martinez dot at disroot dot org>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.4.3
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

sha256sums=('4c21f762d7f6366127700317016e0cf9a6e1e65ff2c57a7a98583525b4f6e051'
            '3a66539b4d32d1d3feadd0d007721723409788407064f938d9d1d5578d5998ee'
            'f42c973dd90e7a6542fa8c191a6a46010846a7c867e9055954a25693ec930569'
            'a20d8a4066fb94f1212078a01d2197b9e00693a5fc3e6874e6b52229e0624409'
            '6138ab040bc6bbebcf24c344b8c577d699249ec4a2c6757d335c7458221a09d7'
            'a9b3f8dfc004736b4b7c6b5a5671fe8602384a161be65065e5d43d05a44181d2'
            '371c7fdb85e7220309b40b2b17e09c62dacbd916546536fb136dddd61ef51109'
            'd200d4771e4a413bed83f0f0b3e1eb1fec21d1f9a565d081b17752f6c33cd9cd'
            '8826c866acc54804f7c78b46cc3a7d0c702e96d9d2a60e77b12298ec93cbe66f'
            '6a6a5f40384bedcf27092359ab17945df0c8e7c9dca24e1d1cbec3f8b9b82295'
            '6fd57a2b1552af2840318c8dbe531ae5c0e59ded1400d8d703a1ad8e36a371ac'
            'f5ddd782c7faffe0c702f102dbfd25be174cd78da30a2361c9b64acfbbc0c9a4'
            'e508bff9723fa3a01d1d9769e30dd8c015d52a12b665883e8c7e58aaa8f5682d'
            'f454f6a24b3273a532ffac01a763f7dac93f14f9112fa6d02faf7d2bbdd4ee70')
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
