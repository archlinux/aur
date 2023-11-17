# Maintainer: spookyintheam <spookyintheam@protonmail.com> 

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.7.1
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

sha256sums=('9d20ef16f1870a9698d7e523a959de0db2ca50cc13916d05f54227a9a31f6c64'
            'e3f71e10a6f75f18962f3cb9150cf84a962e1a3530a225deea4f827214581799'
            '793cfddd6905afdcae8d1ff61fdd5c3b0652485c828c692142c5500083191bf5'
            '7e2df7c997aca51344fed589b9549d7e2676cef1e197fbdcf119c75983b29308'
            '414136a1acb76c3de5bff6c1eabbe78e0ef8988855e27f0e10b46ed0e130c092'
            '0e0bb17fd7d793c3bb129b37acb29e73409c4aef27cca9a8324837f954085ac0'
            '876a52d8722f6a25b79daae2d7f05383f991c8f31006c38b078b7bb7ea1179c6'
            'b3af489e2fa16fc8b10f98f4cb8f241b872a38aa7fa9a05d7692e8b6fdb4bef1'
            'dcd2630abe126c172c2caff6dd45670b2a91373b292a806c23acf29e4ed93966'
            '0565b588982e1c0cb0923dc8614faf01b0aaf2c748f3b4a45da21a68d30383e4'
            'c5cdff346806ec489ddd2c86db0bd77589695397c49431634cfa14c651c0bace'
            '8f564ae2edec5019e62ac24ea80949ed463687fef8fe254162feaf59e286718a'
            '5461b5b183ec792597cee7f71cc6ee6462c57bb038db209faef20ae19bc86c6d'
            'caf0eba29919eff89f1979ab04270c36b2a306efb6ce2657695c51a7a5ec1482')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Frappe-* "$pkgdir/usr/share/themes"
}
