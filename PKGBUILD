# Maintainer: second2050 <dilan.neusa [plus] aur [at] gmail [dot] com>

pkgname='ttf-delugia-code'
pkgver=2108.26.1
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
sha512sums=('9feab7216949515b06bd41d4738823e45f6739c3aa810278a3fd9eceb969e4b30e3371438656a1eb79e5d8a8ae69548b0065d86b04d7a031b3dac866255199aa'
            'e9093af5021d9ae6d376ac950b53bcc94d4cf1c62599fd1e301a95e069c03102178b2218ca2b45d6dc1095843815fde9661cb676fb8803a068e9a1596a823e25'
            'fb913f752f2d97ca659eed1f34ee8c77a35867bdead3373d97bca2fd39339381153fa37002caf7ba6dd460da97a96f90e99ad2365e2cf01fddc7d4704d84f30d'
            '87021261b29ffb1e990abcbb073844e9212fc77e4b8129ee788d456c0c3645edce050159ff099c442e943f4877f5d0074afb1df3b5860283af8ab3e7d092707f'
            'c09155c2f8728156778a6837bb58ee27e7c74d3a9174c576603e485b84403da0366d181eff2b789f04fbcd1cf36f87a9532cdac0ace3ef86dc1099667743ad48'
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
