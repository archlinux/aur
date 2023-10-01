# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.7.0
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

sha256sums=('e2f2d8cd08896d197b459fe3a576e658454f1ddf7e165a43de87bee9b69e114e'
            'e907d0dca7d2a773e390f69391b11da917e94053690c7695bf1af3cc6f209e75'
            'c40d75279511bc48a543f0adceab12e6ae71062de699b74256d99303d43aeedb'
            'b7f1d476a197e8dc37bd39e07fc08f3e77b20dc46068398e38dcc35a62b806f7'
            '7fdd6fcd4af925b74938d0ac08544fb3e6d7d17e30739d1752bf1ad086164dc4'
            '7864970019bbd0b9f3ef1065b110edc7701c854e27410da31ab9268c8f9051ff'
            '7f955a6d0ffb20a33c1de445c03b0bc49d21015601be6d601059ae12086428a8'
            '4c187bb4501560b097f9bb26583d874e177641b5d70c7a686423ae9f09ebfc30'
            '2771266a56f204715ebceeff68c4a36b1241eddc3c231332dde35aa1b9c68410'
            '54458036180a4a6bd61d45572387b0b38a346d07dbe89784bf2a80131b3c5a71'
            '83246409a5cb38c95c42e76f48316ad369abe65c5699f6e029e2d7ac8a695315'
            'b335b2713209cd4eb1e731d672fb3f03f7f67bbcb41cf623a7433f87db7b840b'
            '69a8e86b6300e505c8d73c05c9e68722d336b35967f40e2f50d8337d8a29a620'
            'c959712337b9d116fdcb0643a66e9454c0c857418212edcd5d9f8d7f883bb986')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Latte-* "$pkgdir/usr/share/themes"
}
