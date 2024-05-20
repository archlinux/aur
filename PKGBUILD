# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.7.5 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=2
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

sha256sums=('9619ac92c2f8a852907b729fbb8c7b5f45b4967e1260b8ce27caaa37270ea77a'
            '136ac3cf8852cfbb980d27e5a4edafedfd742b28d552c10d1cdd0298a8e4cef9'
            '64cb9d38ab5c48e7445be4e24f2b9a8544062e7a29b796c8bbb7cd46b79022c2'
            '0b0ea2d97f3e832ef25c819f34b9c96db5f9d56311f820104ae9aedfec36b083'
            'f0c53c483829dd04b42e225b370c3ea1c70682cfbdb0c40807f36d064dea5512'
            'c6d263c8a0d5d0d65879d8feee79507d6ed4a355e7e11a8399f0f2257a909170'
            '97f3dd8743b5f58037e0a836f3b170143add5a4eac2709f3ee32fc9517e32572'
            'f9257ee6475ddc808bbca661bded1e2f72847a2de15fa05d9a8fec90af8e70e2'
            'f18d9085aa67cacd15e5a9aefcce30671d49ed49403090a9f5ad288230b470b3'
            'e83979c13c3e669d4d6b3c1fa46063f6ba2af075578f3b418da57c0615639034'
            '58181b99ec40396b4d5f8d56b4a44f490406403d8d6ed34e55b6c07b50105dbc'
            '206bd992be7a5ca5c8dce559df7da0345f0178877111cb49a28d86c519b5e93c'
            'b781b9a96d2641a329d9703188443a68aacbefda7e4af5abd52942348526fd07'
            'd90478713a7c9c476bc7e881dbabe53ed7f183f94baeb699ccd162060b746250')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Frappe-* "$pkgdir/usr/share/themes"
}
