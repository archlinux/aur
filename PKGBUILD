# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kured-sentinel
pkgdesc="Sentinel script for Kured - Kubernetes Reboot Daemon"
pkgver=2.0.0
pkgrel=1
arch=("any")
url="https://github.com/vbouchaud/aur/tree/main/kured-sentinel"
license=("MIT")

sha256sums=(
    35e3cbe726e28f2f624acbe4fce8af09715e55537df7aa22ac89f00cde399515
    066e168bc38d99cce7937098ecbc094eae1a6671733cdfced0c8d76b987da873
)

source=(
    LICENSE::https://bouchaud.org/misc/MIT.txt
    kured-sentinel
)

package() {
    install -D -m0755 "$srcdir/kured-sentinel" "$pkgdir/usr/bin/kured-sentinel"

    install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
