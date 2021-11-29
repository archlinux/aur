# Maintainer: second2050 <aur at second2050 dot me >

pkgname='ttf-delugia-code'
pkgver=2110.31.1
pkgrel=2
pkgdesc="Cascadia Code + Nerd Fonts, with some small differences."
arch=('any')
url='https://github.com/adam7/delugia-code'
license=('MIT')
source=("delugia-book-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-book.zip"
        "delugia-complete-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-complete.zip"
        "delugia-mono-complete-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-mono-complete.zip"
        "delugia-mono-powerline-$pkgver.zip::$url/releases/download/v$pkgver/delugia-mono-powerline.zip"
        "delugia-powerline-v$pkgver.zip::$url/releases/download/v$pkgver/delugia-powerline.zip"
        "LICENSE::$url/raw/master/LICENSE")
sha512sums=('3d172501120afc7e529a71ed12e2314de9c367326f8629355469c09d47173a05b4af4611b26b0373f595eb5f00275397854f70cf66ebda6c0e245246e6fc6baf'
            '750f7bf2e6276e6f7807bae54110bb1c67867f37f59dccaf027829768ea637df0b941ebec350a68babd792975cd3819b33bf194d05eb579715e77034ca2e2092'
            '4b2fdd862838150017f64b006bf4a1e8ed0b9703f3e19f0930a0e561c1516b2da7e90c06888e92aece3cadd149c067c50125f9e27447c7430a5440923c2670b4'
            '1cfe9e3135793f56525b593d8963c3b6aa8c169198c2d93489aa6715461d362c734c55ec5dff85ff5ce8a7ea2d5470b12f811b36e7e1aa1fbe0f0790596e87e9'
            'a6451cee3f4d81d731cebe7097c1a91b5b405068bd15e41d88d274ca471c1c89c849ad643b756e6bf7db9c9ba94f7a90c4856dc7742dbfdf75e31264a27db4d9'
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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
