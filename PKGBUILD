#!/bin/bash
# Maintainer: ThomasK1966 <admin at thomass-itwiki dot de>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=cockpit-navigator
pkgver=0.5.10
<<<<<<< HEAD
pkgrel=1
=======
pkgrel=2
>>>>>>> 51c2552 (New Packageversion 2 with new checksum)
pkgdesc='A Featureful File Browser for Cockpit.'
url="https://github.com/45Drives/cockpit-navigator"
arch=('x86_64')
license=('GPL')
depends=('cockpit' 'python' 'rsync' 'zip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/releases/download/v$pkgver/LICENSE")
<<<<<<< HEAD
b2sums=('d1d4765933c957e4d11136acad8ae5b5fa0dc95cbe15bcc10816037e6c4ec4fa606f5c633d4eebbc7dd10d935a888c3840dfef9ea68c828afcbc5a21f8744430'
=======
b2sums=('c29bf15b0698ef971345b2059236d094b9ed76f926c52f85ca4f06d1d451378e9d5d7edd2db835e864b8c3289ed508bd00815b83baa206a8d1196aaf0661587f'
>>>>>>> 51c2552 (New Packageversion 2 with new checksum)
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    make DESTDIR="$pkgdir" NAV_VERS=$pkgver install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
