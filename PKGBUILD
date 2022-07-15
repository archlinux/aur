# Maintainer: Mikhail Velichko <efklid@gmail.com>

pkgname=yandex-browser-ffmpeg-update-hook
pkgver=0.0.3
pkgrel=1
pkgdesc="alpm-hook to automatically update yandex-browser's ffmpeg codecs on package update for stable version of yandex browser"
arch=('any')
license=('GPL')
depends=('yandex-browser' 'jq' 'wget')
conflicts=('yandex-browser-ffmpeg-update-hook')
provides=('yandex-browser-ffmpeg-update-hook')

package() {

        mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
        install -Dm644 "$srcdir/../yandex-browser-stable-ffmpeg-update.hook" "$pkgdir/usr/share/libalpm/hooks/"
}
