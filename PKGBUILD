# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.3.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Macchiato'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Green.zip"
         "$pkgname-$pkgver-grey.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Grey.zip"
         "$pkgname-$pkgver-orange.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Peach.zip"
         "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Pink.zip"
         "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Red.zip"
         "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Teal.zip"
         "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Yellow.zip"
         "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato.zip")
sha256sums=('2d621e448dd31997884ec0ae7dc4c5f3f6b772e625533f300309e354df433587'
            '51e6545c25c53d96cc2cccd2780df1e1394fb3f7ad79ca8772cd4796a4673fea'
            'b17bf407894f0125e253e20936febe7a549a341a636ab6d938caf36a459221a6'
            'a26dfaa174dc5003c56b2d51b4f8003833d0fc68c75c2a90c4e5bf9d4ef9b735'
            '53c105be883741d4dd627a3d8c394449693f0e7d93562bf485bad1238a96ee2c'
            'e68d91bc350dfd007f69524d56fb2368fe9bc0deee2e63626c10ab47adab3d9d'
            'cedb5684b36baaecce5baf1bb132b9c11d5a40b121169e22589ac01c18f7f8f4'
            'b6d059956d2c7a577221136bc0ff3b968e954ba017978f7f4a703ec030e1fbde')
package() {
  install -d "$pkgdir/usr/share/themes/"
  cp -a --no-preserve=ownership \
      "Catppuccin-Macchiato-Green-hdpi" \
      "Catppuccin-Macchiato-Green-xhdpi" \
      "Catppuccin-Macchiato-Green" \
      "Catppuccin-Macchiato-Grey-hdpi" \
      "Catppuccin-Macchiato-Grey-xhdpi" \
      "Catppuccin-Macchiato-Grey" \
      "Catppuccin-Macchiato-Peach-hdpi" \
      "Catppuccin-Macchiato-Peach-xhdpi" \
      "Catppuccin-Macchiato-Peach" \
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
