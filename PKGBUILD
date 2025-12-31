pkgname=kumono-bin
pkgver=0.56.2
pkgrel=4
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source_x86_64=("kumono-$pkgver.x64::$url/releases/download/$pkgver/kumono-linux-x64"
               "kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_aarch64=("kumono-$pkgver.arm64::$url/releases/download/$pkgver/kumono-linux-arm64"
	        "kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums_x86_64=('89a09ee5f08ef8699faad916918d1e723fdaa9e6630d872c3149e863524bcef4'
                   '5fef56943e4def95c5ec28bd4467aeac7485b3e4d73c1111d38af09a42418353')
sha256sums_aarch64=('ca06e28934df4871f86254733d1cafdd43763d823581a680a07fb67e31a2075f'
                    '5fef56943e4def95c5ec28bd4467aeac7485b3e4d73c1111d38af09a42418353')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package_x86_64() {
    install -Dm755 "kumono-$pkgver.x64" -t "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}

package_aarch64() {
    install -Dm755 "kumono-$pkgver.arm64" -t "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
