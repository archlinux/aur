# Maintainer: second2050 <aur at second2050 dot me >

pkgname='ttf-delugia-code'
pkgver=2110.31
pkgrel=1
pkgdesc="Cascadia Code + Nerd Fonts, with some small differences."
arch=('any')
url='https://github.com/adam7/delugia-code'
license=('MIT')
source=("https://github.com/adam7/delugia-code/releases/download/v$pkgver/delugia-book.zip"
        "https://github.com/adam7/delugia-code/releases/download/v$pkgver/delugia-complete.zip"
        "https://github.com/adam7/delugia-code/releases/download/v$pkgver/delugia-mono-complete.zip"
        "https://github.com/adam7/delugia-code/releases/download/v$pkgver/delugia-mono-powerline.zip"
        "https://github.com/adam7/delugia-code/releases/download/v$pkgver/delugia-powerline.zip"
        "https://raw.githubusercontent.com/adam7/delugia-code/master/LICENSE")
sha512sums=('a480d8b0534c37f05cdb73893081058ce473efeb3c410ec51918ac3782ff10fc2432680d730be077a6875838986d8ec1fc64197ec250746f0b4eb3bc18c69737'
            '21be5abd509ab2806308c3d64221a370006bac30bf64c53669a670948c32393a754860c85fe668361ca519a6f844a66bc2658e7769687719982a7bdeeb9bdf0e'
            '8b6ae9c915878e1e8a4916578d3b07856c21a4841e16fc3df4dc436e6fdc50f87a6d2102d1520b2ef0d97b65605afcf80aa23d90925ffce975bfacb6cfdb2f66'
            'fd2a47f3f5694a13c1e4a9043b07ec0d1e9b5f3720e85d802dd5ebf9f45c9132bb7c519b07c9590b9c7b0122b12d5f5f0160030f16716d9979fdbd61e4ec800d'
            'de04eb41cd1f46a8c66c2835805432da469c56182f0e9fa0f7ec1fee38868da5f5b5dbd18dd1dee7f40bf8a207c9556c973e96def1202cc2e475b87fce752ac6'
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
