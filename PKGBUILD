# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.4.1
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Blue-Light.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Flamingo-Light.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Green-Light.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Lavender-Light.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Maroon-Light.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Mauve-Light.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Peach-Light.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Pink-Light.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Red-Light.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Rosewater-Light.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sapphire-Light.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sky-Light.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Teal-Light.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Yellow-Light.zip")

sha256sums=('4e67eeb0ce25922815c6b34e5e7078f6058c316cbc4a8da6b3f6cc66b1081384'
            'd504cb5a07006dc2b4f68adb57477f828db6f16df0163f71e36aea7c94dd49ca'
            '3b56061417e995218aa2243d93be8d383a4d6093a3f51549e1fae49766fd6940'
            '7d8cf12038c29cec4039e5ef70f09b85b74f62924f5df4c54581b6d8380d50bc'
            '5f25a022bb0201c1d83e3a751278ec4e214abd8472d5fb2ddb466b8f5199d02f'
            '910bc66b6208773b3c05564530805722591388ba44de2d0b78366d9b19c04026'
            '84dfc165a1bb745921a550dac1062ee060097bd697489444d5c6d7fde37049b7'
            'f41ee6fbc00b63337c22367de1addfe9abd05c1ad4db216c8207b0aac92f50c6'
            'bbf166ca9babcb94997f0f5c9cd6f0493cb6b5bc3f73c7c258409f0e07fab90f'
            'bde23b07b2b498d797d575c926ab086469278a14681a857d1386c510cab98536'
            '250ebb9b8c9e481ffed8210575dc2b6b1d08f1665f0b0cdc60447ad1ef104169'
            'a0da9c79e284b102770c80924087e9508abe69e42e373397c2b03b473c09ae33'
            '1ae509a25ebd8167b35593f009942bd65a7758c3a7ba074b0951cd5ccb0957c6'
            'dd9a1ad8b6af59556daf1232af3a1caf27d67a084a5e721532ac4623ad751688')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Latte-Standard-Blue-Light-hdpi" \
        "Catppuccin-Latte-Standard-Blue-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Blue-Light" \
        "Catppuccin-Latte-Standard-Flamingo-Light-hdpi" \
        "Catppuccin-Latte-Standard-Flamingo-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Flamingo-Light" \
        "Catppuccin-Latte-Standard-Green-Light-hdpi" \
        "Catppuccin-Latte-Standard-Green-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Green-Light" \
        "Catppuccin-Latte-Standard-Lavender-Light-hdpi" \
        "Catppuccin-Latte-Standard-Lavender-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Lavender-Light" \
        "Catppuccin-Latte-Standard-Maroon-Light-hdpi" \
        "Catppuccin-Latte-Standard-Maroon-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Maroon-Light" \
        "Catppuccin-Latte-Standard-Mauve-Light-hdpi" \
        "Catppuccin-Latte-Standard-Mauve-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Mauve-Light" \
        "Catppuccin-Latte-Standard-Peach-Light-hdpi" \
        "Catppuccin-Latte-Standard-Peach-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Peach-Light" \
        "Catppuccin-Latte-Standard-Pink-Light-hdpi" \
        "Catppuccin-Latte-Standard-Pink-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Pink-Light" \
        "Catppuccin-Latte-Standard-Red-Light-hdpi" \
        "Catppuccin-Latte-Standard-Red-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Red-Light" \
        "Catppuccin-Latte-Standard-Rosewater-Light-hdpi" \
        "Catppuccin-Latte-Standard-Rosewater-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Rosewater-Light" \
        "Catppuccin-Latte-Standard-Sapphire-Light-hdpi" \
        "Catppuccin-Latte-Standard-Sapphire-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Sapphire-Light" \
        "Catppuccin-Latte-Standard-Sky-Light-hdpi" \
        "Catppuccin-Latte-Standard-Sky-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Sky-Light" \
        "Catppuccin-Latte-Standard-Teal-Light-hdpi" \
        "Catppuccin-Latte-Standard-Teal-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Teal-Light" \
        "Catppuccin-Latte-Standard-Yellow-Light-hdpi" \
        "Catppuccin-Latte-Standard-Yellow-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Yellow-Light" \
        "$pkgdir/usr/share/themes"
}
