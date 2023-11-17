# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-mocha
pkgver=0.7.1
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
sha256sums=('2ebed8042666e97432ecc04af3a06b55f9a0f11efedd6c1a6e2a57487ae8a665'
            '511a1a4de8adc09da1fb99e04c0f8ba94abf7ef441c2b93d0e8358e5b20499f4'
            '9c77d37cb6309503a525dd08fca350e2cf328053e33a2c854509b847d56cb5bb'
            '056c28d403c5ab94bea7f75b095e7d8184611548e65860e8a988095300c5b882'
            'b388b90e9a54f6dd2637b57d5cf120b0b37e42b588c6582acb6882cd9b1f9684'
            '654b221ea6cd633bcf3c2f21f9ecbd9bfa783e1ca4472084c05b32b7cef46b49'
            '0cab254b0d0bb2309836d75996f4697a7b9c3f063d0d66e6c02c3aa0addc794b'
            '7fbcb63084062c80f419f012400ec31dfd1ec604b64213abe449115153c82126'
            'a6044339be01625d493c6d0c2d14b32d8faaa3ef993b4b539b0db56b488da441'
            '174446fb37e296d77fd4ce721885616c4d80acffa15270b5f695e8bedf6f1a99'
            '76882df1fecc3120edd6ae58c1eba27b2c2f7c7f0244b932f858f5742da476bf'
            '2a8c9e8d4f59dcb709ff7a6198f1ff4816b63953e6bad9882f28641a87509428'
            '1ec9f23c11398245ec1767e0aad9963e6aef459e834e78e23bdeee19c13926cc'
            '087924d71d23e8c0e6211aabf19d14a055a7f009c0d63e13f7ead3d6d6ebd3a5')

package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -r -a --no-preserve=ownership \
    Catppuccin-Mocha-* "$pkgdir/usr/share/themes"
}
