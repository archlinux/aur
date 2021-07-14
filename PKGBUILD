# Maintainer: second2050 <dilan.neusa [plus] aur [at] gmail [dot] com>

pkgname='ttf-delugia-code'
pkgver=2106.17
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
sha512sums=('1ed0db062d8de8d43256684c0b56328dd731247e956a09fad2e514d3dab37fb6e26642e933d3bac5da4fe869389bfbeea8ef2d9ec2f70044597802234b56ab95'
            '299a7e870cb3d58a50c8f7aa6757b4fcc7f1b8505444d9453bd1d226bee9d889101c15a49111a1613169f6f5db298c0b79872476d791c50d653ef5fba9921b4d'
            '3f1ac8d4e1a4ee06d3112c4f8e167f93b8f4c96e5402b5ea20ecc49c3b31c5ba8fb7ca36d9431920e4a1541250f898f077e284b6a2516decf2859d4e4f0def47'
            'b58d1daef1743478915bd86a60ab214ac5582886d161296eaf255e6c42dae0726adddf85e4d6cf9d53c05193a852f3d6e066c072d3375a3f8db310702b9fe5e1'
            'ad0c6bf188e04facc06d12a701be4bf120274e8046ff68e3374376ffd8cd55869d9ae4160a14aa335ac3b417b30702d1c3b2dbc5df72a631f4f0696051081516'
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