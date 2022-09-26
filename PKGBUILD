# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.2.7
pkgrel=3
pkgdesc='Soothing pastel theme for GTK3 - Macchiato'
arch=('any')
license=('GPL3')
depends=('gtk-engine-murrine' 'gnome-themes-extra')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Green.zip"
         "$pkgname-$pkgver-grey.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Grey.zip"
         "$pkgname-$pkgver-mauve.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Mauve.zip"
         "$pkgname-$pkgver-orange.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Orange.zip"
         "$pkgname-$pkgver-pink.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Pink.zip"
         "$pkgname-$pkgver-red.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Red.zip"
         "$pkgname-$pkgver-teal.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Teal.zip"
         "$pkgname-$pkgver-yellow.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato-Yellow.zip"
         "$pkgname-$pkgver.zip::$url/releases/download/v-0.2.7/Catppuccin-Macchiato.zip")
sha256sums=('5395f19aa8cad53d784514b4a5303c87075dfb1981aed178384371339bc15e1f'
            'cd728f77698c0b54c1893fa2d92e97cb4742ec84806b7a5cc32805505fc7b6dd'
            '2509715772c3e8285b5756936f59f5cf4cd7153de6cfb5d9aee6b69fb53b2180'
            'db359e5f68a57f92bbd605406afd23fadc652a2c66c08881b7fddfa7b6f75fd2'
            '20c5eccdc203fa0ea38e2f9c29c110b86e050e47eaaaeb8343780ad86d62dd83'
            '81fa89221e9812bb1814caa1bfa42c9095da65df088c9177886eb437b03b3fc3'
            'b887d219bee8a7e54c58b86bdc2130cf0d8ec165b72b4d6692e343d9a0bd4d7f'
            'afd193d12cc272a6745be41fc082d059dcb5b57be6e798b4a3042701d148093d'
            'fe283a3723e5737f7bc53be44c4d709eaf8b62146a6f043b9c3af67b79db25a4')
package() {
  install -d "$pkgdir/usr/share/themes/"
  cp -a --no-preserve=ownership \
      "Catppuccin-Macchiato-Green-hdpi" \
      "Catppuccin-Macchiato-Green-xhdpi" \
      "Catppuccin-Macchiato-Green" \
      "Catppuccin-Macchiato-Grey-hdpi" \
      "Catppuccin-Macchiato-Grey-xhdpi" \
      "Catppuccin-Macchiato-Grey" \
      "Catppuccin-Macchiato-Mauve-hdpi" \
      "Catppuccin-Macchiato-Mauve-xhdpi" \
      "Catppuccin-Macchiato-Mauve" \
      "Catppuccin-Macchiato-Orange-hdpi" \
      "Catppuccin-Macchiato-Orange-xhdpi" \
      "Catppuccin-Macchiato-Orange" \
      "Catppuccin-Macchiato-Pink-hdpi" \
      "Catppuccin-Macchiato-Pink-xhdpi" \
      "Catppuccin-Macchiato-Pink" \
      "Catppuccin-Macchiato-Red-hdpi" \
      "Catppuccin-Macchiato-Red-xhdpi" \
      "Catppuccin-Macchiato-Red" \
      "Catppuccin-Macchiato-Teal-hdpi" \
      "Catppuccin-Macchiato-Teal-xhdpi" \
      "Catppuccin-Macchiato-Teal" \
      "Catppuccin-Macchiato-Yellow-hdpi" \
      "Catppuccin-Macchiato-Yellow-xhdpi" \
      "Catppuccin-Macchiato-Yellow" \
      "Catppuccin-Macchiato-hdpi" \
      "Catppuccin-Macchiato-xhdpi" \
      "Catppuccin-Macchiato" \
      "$pkgdir/usr/share/themes"
}
