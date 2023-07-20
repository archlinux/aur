# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="gcs-bin"
pkgver=5.14.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
provides=("gcs")
conflicts=("gcs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs-$pkgver-linux.tgz"
        "gcs.desktop"
        "gcs.png"
        "LICENSE")
sha256sums=('47aa3152f2c322f40dda37660b9c896cc0f8e7fe8919a17a149a805e3b91d166'
            '16e44836bb5939a825fb58e87ecf517bb74ed2fbbc148fe743fd69483af55b7b'
            'c04ae3c2efe1d6f7b02188233d99170f46e0ed912a115de8eae6f0a99d54b5ce'
            'fad8352cbe354588751cbe40e2c7b2b6a748be35c0903d408a3aba15f1aa9ed1')

package(){
 install -D -m 755 "gcs" "$pkgdir/usr/bin/gcs"
 install -D -m 644 "$srcdir/gcs.desktop" "$pkgdir/usr/share/applications/gcs.desktop"
 install -D -m 644 "$srcdir/gcs.png" "$pkgdir/usr/share/pixmaps/gcs.png"
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gcs/LICENSE"
}
