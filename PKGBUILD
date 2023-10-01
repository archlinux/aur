# Maintainer: spookyintheam <spookyintheam@protonmail.com> 

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.7.0
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

sha256sums=('40d375531d49a0ca988bafe609fe885875c19d00a5bf3f12658eda4a594b6e67'
            '686e8af2444deb287fde06d89606c42ea2c9847da9f60bb197a6fbe5a5a589df'
            'd03c527b4705c6e25e8c251adb0ce9e63d06a94601620fe81c88ee3134b1a782'
            'b3daea4415bf16c44b3a597cf37b98ff572c83f703740c1d544eec10a6e15b77'
            'd4c77f9a956c2bc0d2ee66fe1ca19ddb07bff66d0b688b60012198865ab96957'
            '3e0d5caeba25cfd9a975cdb6caa25d7e71ed7648677a5ce7dc80615ade302483'
            '348d02f6a1d2cabbd899157c58c1b48f3338ef764be8c1650f9f35356584cd22'
            '7a703abcffbdf1c8d0d5f0fb207dd0b2cfa4dd0260ce1f463e1a8c1fc0f0f570'
            '28640d84196604d2299b3887b39697b3cd6ca547249ab89cd9fceb3d0274b059'
            'aab84159d32091198cc3bd7e5ef01668956444cd231f79432207d50de5450c44'
            '08c742f64c749fce01348a6e1dfba9e865bd9bda8992418be630f7702f0d1571'
            'c6c09aa02f46f53d00a96cc14e161d0983dfd2cd8d387b6238efcfc30cccee5f'
            'e1baf4380e995f9398f725f999a33a0d2ba2e388007b25a615495587ddb32672'
            '025f1c6d9e5d1ba05bbd04c562fd9aeaa0a73d4701b79e7b099c02bcb80442bd')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Frappe-* "$pkgdir/usr/share/themes"
}
