# Maintainer Ruijie Yu
# vim:nospell:ft=sh:

pkgname=pinentry-dispatch

pkgver=0.0.1
pkgrel=1

pkgdesc='Dispatch pinentry based on different use cases'
arch=(any)
url="https://github.com/RuijieYu/$pkgname"
license=(MIT)

depends=(pinentry)

source=("$url/archive/v$pkgver.tar.gz")

sha512sums=('a87c8114660331d17debfe6ef7b1772401ff4c1d80483fe8dc159f54f5015b0f4ab756365800e71f6599b660299111eb575e55d5732183f8e5511534eca63507')
b2sums=('937c539804bd42a3e5ecaa0a64524a81ba9d9c93369345822f6cf1b8d33958cbc3dbbb53da2d7e64ea8c7329de33ef419755d2ffe7cc46ff05ce9b897a904fa4')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install \
        -Dm0755 \
        "pinentry-dispatch" \
        -t "$pkgdir/usr/bin/"

    install \
        -Dm0644 \
        "README.md" \
        -t "$pkgdir/usr/share/doc/$pkgname/"

    install \
        -Dm0644 \
        "LICENSE" \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}

