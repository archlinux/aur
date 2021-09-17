# Maintainer: second2050 <dilan.neusa [plus] aur [at] gmail [dot] com>

pkgname='ttf-delugia-code'
pkgver=2108.26
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
sha512sums=('b866afad42893878a41a8999f52ba57a982d233f0ade785ddb9786eb12039e48770dc5ae540c4817823531f239d096a2e910587b6bf0985ae1cdfbbe5bd04e1b'
            'e0c1bed26c60fcd2b1c77a0a34ef924db693bfc7f9647933f3b4c50a2bb151f2bd3ac0b75818c0ed1020a2ab9093a333773dd24b38d87178a33f89cb99e50952'
            'a5abef92d36328ab2920cc4cb94800208a7240d6f1fae61096378d502c7ed1d4a2d48a29e47be217d151c2cea42b248b00415e47deb3d7679226d6d871a3890e'
            '312cf96abe2efa5b8402f5369e415fb74843b300c757036f6d626dc054295aaaf4410060537f68726564327d90f98a4ab60b1cd718f5071ad88193016d3e8078'
            'aaa2f5a5fb72451cc73b0b8ef977e6e76fe8b81e31797d3c0609d59ed0783015a3825586f13959a549d9dddf2b7ef6e4945a8354138994b142f9fa746324ffd7'
            'e8bd6f5cbf2e0c7684b41ad75a6df681fb8db4482592cae334f48efb45f70f091ebd9243df7872e60aaa0f1c7b0afce9a640879e930d71d836b7b3490ca7a7aa')

package() {
    cd ${srcdir}
    install -d $pkgdir/usr/share/fonts/TTF/
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
