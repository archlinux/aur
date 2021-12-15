# Maintainer: second2050 <aur at second2050 dot me >

pkgname='ttf-delugia-code'
pkgver=2111.01
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
sha512sums=('94baa140ebc62d2155760586d43760dc34f650ce14d8ac01f420d702f4cac4b42cab43059998b2ebd36c67510c1fb5e80326e47ddb99c59d1a380e5795fe5f0d'
            'dfb1dacc4f9c82f24aa5f56e5749a1a9e5a728bc8d05bf2b3697450dc01768e0b52032392a39821352883c747ee690c643e7188929f9051c0fd1f8992b57df64'
            '7f316ff8a5d1b0ea97edc095a9cc2bb66e8d7284056c974139de4075fd1cd2427625439556a886dc1f4d9416743831d099d9af86980c429e515de8301ddf145f'
            '694a84ec04e9e334cb80199b18a625cd98adfaea5a6be03ba624a428370321b73e4879f2b6f8458690dc5572bf21cd18f0667a6679586075d74800ff5d8ea02d'
            '90bf147e2729340e8b55c230b8accb34db301687b79fc791f19c68a754391cc45adc22e93774fe6d049d7cdd4cbfbdc39f4b3499f2a838bc8ed0e04d9036f74a'
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
