# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.7.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Mocha'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Blue-Dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Flamingo-Dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Green-Dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Lavender-Dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Maroon-Dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Mauve-Dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Peach-Dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Pink-Dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Red-Dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Rosewater-Dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Sapphire-Dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Sky-Dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Teal-Dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Mocha-Standard-Yellow-Dark.zip")
sha256sums=('5a6f8e5a8065bb17100a9a9ef47656d4df62e047d299f11ab4d36bb9f465d714'
            '8d126a403d5965d1369a436270e2cd5dc2e1ef5787a2cd5a2bc24f95e004f082'
            '0537031afd9b74cf5a3987f7330072109b351a0365408b628012a5adc1e8ba4f'
            'e4b0af2c4f70ec354ea4bfd1f0ec73935ca6cbf5b868828ef5a0de49020217cb'
            '9b1d4d3aba79f94f9712b33aea306d1729546bf05372e57fc8ac8c69050c07af'
            '7f11c561fe1ee90b380f56f2f943534960c76a2050c8c7741966ed61b6d55e68'
            '0d6a1d1a45c089552fa95b2b74e7672b78c9222216ef5312cd1dce09f5f48406'
            '693d3b5e1dd53cb65268a7d3a935d0dba39abebeedf2f2653dc8cc94c963b95a'
            'c2a196704d105e63d33ceae6403d9370dc244d75239e91919a4058329b91ac3e'
            '043fed2fc5cfd3edc09c6406d29e9afc67abb26f7281f5926f0bdd4c32daeb77'
            '86dad8062dc07447b4a0f67cb4be03b68f247709fa8a3fee09d946811519540f'
            '2883d5392f5a452f46ae80d47f24d340f0bc8ef8a9e031ad9671e794da8b2d55'
            '31dea3db61d1cb9ed93e3e29f54b1596b1ceba0251498837e1bdc9f60e994957'
            'fcfbbff2367b2532b3d15175dc206ccec2bcb32a06af705220723d797eb8636e')

package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -r -a --no-preserve=ownership \
    Catppuccin-Mocha-* "$pkgdir/usr/share/themes"
}
