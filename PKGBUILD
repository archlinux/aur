# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=thyme-bin
pkgver=0.2.3
pkgrel=2
provides=('thyme')
conflicts=('thyme-git')
pkgdesc='Automatically track which applications you use and for how long.'
arch=('x86_64')
url='https://github.com/sourcegraph/thyme'
license=('MIT')
depends=('wmctrl' 'xdotool' 'xorg-xwininfo' 'xorg-xdpyinfo')
source=("$pkgname-$pkgver-$pkgrel-bin::https://github.com/sourcegraph/thyme/releases/download/$pkgver/thyme-linux-386"
        "$pkgname-$pkgver-$pkgrel-LICENSE::https://raw.githubusercontent.com/sourcegraph/thyme/$pkgver/LICENSE")
sha256sums=('cd45be4907826af1b3be4c38ef3c15e8ce62726a60d47b047d92636e75fb319a'
            'ca6fb190e4483913af361ab0bd843c8be475add979a9c91c01e77d399bfd594f')

package() {
    install -Dm755 "$pkgname-$pkgver-$pkgrel-bin" "$pkgdir/usr/bin/thyme"
    install -Dm644 "$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
