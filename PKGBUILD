# Maintainer: second2050 <aur at second2050 dot me >

pkgname='ttf-delugia-code'
pkgver=2111.01.1
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
        "ttf-delugia-code-LICENSE::$url/raw/master/LICENSE")
sha512sums=('c63f58261f9facf92d253f107802d7ca9cfea4e93ddeb99adda789dfbad7a9da02e2f9799d7be6bfd7a7436b6edb0af2956a3462f123b12a2714b49b27e18c2b'
            'a1aa9b79911b0d0696b8923142ae5c95423feaf43460870a1db31c0aa07ecf94b4faf27ce8d1fe2c9c83430ee882bae37b227dd436c13361c4f2f1614e3d5de9'
            '8d6d585a424f6cbfc64b4916fa44154e921a6d1387e5a293c17392dee1c979ed5c0419f0c46ee2542c3e42f44835ea335a7ea4d9ecac3993e1b1a5a0ddcb8740'
            '3623d5cc9f81aeb49a95b630042783896ce64957e351ae8607250d7dd24571d3c00f4795e29902f46c2a0dba5ffc8e1172a602afd82e859c4866fc199c996ecf'
            'd27f43f60a291a7a40cbeda3417665a53aae1af6acab922091fe20c4f618cd9006711129ec41255d8518b908aec8602c8e5da141d8433976ddb9aa20504ec7b4'
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
    install -Dm644 ttf-delugia-code-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
