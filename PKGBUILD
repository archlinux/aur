# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=signato-font
pkgver=03.2019
pkgrel=2
pkgdesc="Cursive font based on the Act of Independence of Lithuania"
# unfortunately, the website no longer is active
#url="http://signato.lt"
url="https://web.archive.org/web/20230606100230/http://signato.lt/"
arch=('any')
license=('LicenseRef-Signato-Font-License')
source=('LICENSE.en.rtf'
        'LICENSE.lt.rtf'
        'Signato-Regular.otf')
sha256sums=('7d7c90812fdbb86b8acae682b5dbb9ffbbf825d64d6e5e8e6c57c8fe72facdf6'
            '7e37718578afc61e77d33fd9fc4fb898f807a06fb480ca8d03a0911d3dbdb2c9'
            'eb9fa0d32709b416841c425ecc84eebbe415d37c5dcf4c75c361cf55ffaf4235')

package() {
    cd $srcdir

    install -Dm644 'Signato-Regular.otf' "$pkgdir/usr/share/fonts/${pkgname%-font}/Signato-Regular.otf"
    install -Dm644 'LICENSE.en.rtf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'LICENSE.lt.rtf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.lt"
}
