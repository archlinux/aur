# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.6.1
pkgrel=2
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Blue-light.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Flamingo-light.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Green-light.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Lavender-light.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Maroon-light.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Mauve-light.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Peach-light.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Pink-light.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Red-light.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Rosewater-light.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sapphire-light.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sky-light.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Teal-light.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Yellow-light.zip")

sha256sums=('5f49fe3ce0155486fc8adebe958b73b38ccbba7b278f5321c3e92c14198500a6'
            'c3792b613e565e20d59804178d6d7c2519fadb6e1800a5f0413e307284ded596'
            '183368a1fe863976084e4fb29baa4df06897b3ec4878f7afa3cd591550a2dbc1'
            '67d1570fa2cb1b84714d17218854c1777ca10b21a69a1d25df48c77835c0067a'
            '9b2c59a9203e54a04e45e4e2b0e6b6f2ca670452674245b29735abc983a186d4'
            'f23ee3c802e169c580933770c7036174c4848ba0bb445baeff34d7d8aa28e324'
            'cb76bd8b80c56ec77b985ecaf94cf7cab6dff84ccc89beb310a0650c55b15f4c'
            'ecbb58be6580cb3bd52c5da13c61d80b55d6bfdbba64064b2db338a4b137baee'
            '4e00b98173995bcdeb82db8fcdafdac9903e37b542c26aa8285fd3d06f2619e3'
            'fedde410ad7fb2a88567305fc71bbf1fa3660aec46cad467518cb66b5b2a93ec'
            'aadf5af1a407ba63bab338ce218a9de9e8db4f5526cd770de975f0cfc7a33ce8'
            '5da5ba50947788a159a7f2b923236716abc410b033af7e091c8b7ce13f0e465a'
            '38e1b78aec3562dc5be5a640ffc7c80a59b6ccbb83bc4a6664e98c015b12d259'
            '8ff9c4dc948e6ce08e3165e3a5ac47c10ea0e60eddccca0a0a7cab5613dbadc9')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Latte-Standard-Blue-light-hdpi" \
        "Catppuccin-Latte-Standard-Blue-light-xhdpi" \
        "Catppuccin-Latte-Standard-Blue-light" \
        "Catppuccin-Latte-Standard-Flamingo-light-hdpi" \
        "Catppuccin-Latte-Standard-Flamingo-light-xhdpi" \
        "Catppuccin-Latte-Standard-Flamingo-light" \
        "Catppuccin-Latte-Standard-Green-light-hdpi" \
        "Catppuccin-Latte-Standard-Green-light-xhdpi" \
        "Catppuccin-Latte-Standard-Green-light" \
        "Catppuccin-Latte-Standard-Lavender-light-hdpi" \
        "Catppuccin-Latte-Standard-Lavender-light-xhdpi" \
        "Catppuccin-Latte-Standard-Lavender-light" \
        "Catppuccin-Latte-Standard-Maroon-light-hdpi" \
        "Catppuccin-Latte-Standard-Maroon-light-xhdpi" \
        "Catppuccin-Latte-Standard-Maroon-light" \
        "Catppuccin-Latte-Standard-Mauve-light-hdpi" \
        "Catppuccin-Latte-Standard-Mauve-light-xhdpi" \
        "Catppuccin-Latte-Standard-Mauve-light" \
        "Catppuccin-Latte-Standard-Peach-light-hdpi" \
        "Catppuccin-Latte-Standard-Peach-light-xhdpi" \
        "Catppuccin-Latte-Standard-Peach-light" \
        "Catppuccin-Latte-Standard-Pink-light-hdpi" \
        "Catppuccin-Latte-Standard-Pink-light-xhdpi" \
        "Catppuccin-Latte-Standard-Pink-light" \
        "Catppuccin-Latte-Standard-Red-light-hdpi" \
        "Catppuccin-Latte-Standard-Red-light-xhdpi" \
        "Catppuccin-Latte-Standard-Red-light" \
        "Catppuccin-Latte-Standard-Rosewater-light-hdpi" \
        "Catppuccin-Latte-Standard-Rosewater-light-xhdpi" \
        "Catppuccin-Latte-Standard-Rosewater-light" \
        "Catppuccin-Latte-Standard-Sapphire-light-hdpi" \
        "Catppuccin-Latte-Standard-Sapphire-light-xhdpi" \
        "Catppuccin-Latte-Standard-Sapphire-light" \
        "Catppuccin-Latte-Standard-Sky-light-hdpi" \
        "Catppuccin-Latte-Standard-Sky-light-xhdpi" \
        "Catppuccin-Latte-Standard-Sky-light" \
        "Catppuccin-Latte-Standard-Teal-light-hdpi" \
        "Catppuccin-Latte-Standard-Teal-light-xhdpi" \
        "Catppuccin-Latte-Standard-Teal-light" \
        "Catppuccin-Latte-Standard-Yellow-light-hdpi" \
        "Catppuccin-Latte-Standard-Yellow-light-xhdpi" \
        "Catppuccin-Latte-Standard-Yellow-light" \
        "$pkgdir/usr/share/themes"
}
