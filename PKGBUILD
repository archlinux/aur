# Maintainer: second2050 <aur at second2050 dot me >

pkgname='ttf-delugia-code'
pkgver=2404.23
pkgrel=1
pkgdesc="Cascadia Code + Nerd Fonts, with some small differences."
arch=('any')
url='https://github.com/adam7/delugia-code'
license=('MIT')
source=("delugia-book-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-book.zip"
        "delugia-complete-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-complete.zip"
        "delugia-mono-complete-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-mono-complete.zip"
        "delugia-mono-powerline-$pkgver.zip::$url/releases/download/v$pkgver/delugia-mono-powerline.zip"
        "delugia-powerline-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-powerline.zip"
        "ttf-delugia-code-v$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE")
sha512sums=('289401cf1d0cbaa0bdd93576e1131015c03b5f5bdeb892e71cba8081a127bc62e688423053f3a6579973cdbae08cf7763367eeeb676e0c04510b39a650bffb7a'
            '6cf750ed8280ba1e58df86d3c724d322ae3f7663a417e170f3ebec63dd0aea4c5abc9ecc5f50cfc79ffda384e9f4990180420f5e5acdf10c2f66dd5603b3f571'
            'f6301749d4d9ecbf8d7bdf6ad0c8453fa95af07010e710ae3b0dcb3c3c3450aea64b8ae679e0551c0ff43fde8852f39163a6439a88e5404860bb03e80ee06491'
            'bf1319dd15a4fba134e13cfab919eaf630eda4c0133fc71de8fadc83e11ded174c086b536a920bcef590771135d91b97b8193a46e23c89aee3d2742e260ea9ec'
            '48cc7208c7ee8377f2ecd93be49aae45db7b525fcf9f47ebebe7ad5448d173150520b049f45cd65939caa142505679e06e97b1a06f04eaa28d63f2ee4dd34cd7'
            'e8bd6f5cbf2e0c7684b41ad75a6df681fb8db4482592cae334f48efb45f70f091ebd9243df7872e60aaa0f1c7b0afce9a640879e930d71d836b7b3490ca7a7aa')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/TTF/"
    # delugia-book
    install -m644 delugia-book/DelugiaBook-Bold.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-book/DelugiaBook-BoldItalic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-book/DelugiaBook-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-book/DelugiaBook.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-book/DelugiaBookLight-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-book/DelugiaBookLight.ttf "$pkgdir/usr/share/fonts/TTF/"
    # delugia-complete
    install -m644 delugia-complete/DelugiaComplete-Bold.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-complete/DelugiaComplete-BoldItalic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-complete/DelugiaComplete-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-complete/DelugiaComplete.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-complete/DelugiaCompleteLight-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-complete/DelugiaCompleteLight.ttf "$pkgdir/usr/share/fonts/TTF/"
    # delugia-mono-complete
    install -m644 delugia-mono-complete/DelugiaMonoComplete-Bold.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-complete/DelugiaMonoComplete-BoldItalic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-complete/DelugiaMonoComplete-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-complete/DelugiaMonoComplete.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-complete/DelugiaMonoCompleteLight-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-complete/DelugiaMonoCompleteLight.ttf "$pkgdir/usr/share/fonts/TTF/"
    # delugia-mono-powerline
    install -m644 delugia-mono-powerline/DelugiaMonoPL-Bold.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-powerline/DelugiaMonoPL-BoldItalic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-powerline/DelugiaMonoPL-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-powerline/DelugiaMonoPL.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-powerline/DelugiaMonoPLLight-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-mono-powerline/DelugiaMonoPLLight.ttf "$pkgdir/usr/share/fonts/TTF/"
    # delugia-powerline
    install -m644 delugia-powerline/DelugiaPL-Bold.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-powerline/DelugiaPL-BoldItalic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-powerline/DelugiaPL-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-powerline/DelugiaPL.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-powerline/DelugiaPLLight-Italic.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 delugia-powerline/DelugiaPLLight.ttf "$pkgdir/usr/share/fonts/TTF/"
    # License
    install -Dm644 ttf-delugia-code-v$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
