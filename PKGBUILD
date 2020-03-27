# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=0.6.8.2
pkgrel=1
install=.INSTALL
pkgdesc="V2Ray Linux client with web GUI, compatible with SS and SSR, supporting transparent proxy"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/V2RayA"
license=('GPL')
depends=('glibc' 'v2ray')

sha_service=ea22c162c1fddb7ed786ab2a402d501c07280604
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=6da6dcf0b0dd3cb2567bf8d2876fd8b9be3cc442

source_i686=(
    "v2raya::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_386_v${pkgver}"
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
)
source_x86_64=(
    "v2raya::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_amd64_v${pkgver}"
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
)
source_aarch64=(
    "v2raya::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm64_v${pkgver}"
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
)
source_armv6h=(
    "v2raya::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_v${pkgver}"
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
)
source_armv7h=(
    "v2raya::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_v${pkgver}"
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
)

sha1sums_i686=(
    '62df3b3d15c46c319462fd23b3bc4b5449a01d20'
    "$sha_service"
    "$sha_png"
    "$sha_desktop"
)
sha1sums_x86_64=(
    '20c3c48112d716e4aac9c84b4daeecce2644fb43'
    "$sha_service"
    "$sha_png"
    "$sha_desktop"
)
sha1sums_aarch64=(
    'c8bd9b8f695a587900b04cb7481664de2f8c945c'
    "$sha_service"
    "$sha_png"
    "$sha_desktop"
)
sha1sums_armv6h=(
    'd497ea634269c9427e17e91e29f745f17c1c135d'
    "$sha_service"
    "$sha_png"
    "$sha_desktop"
)
sha1sums_armv7h=(
    'd497ea634269c9427e17e91e29f745f17c1c135d'
    "$sha_service"
    "$sha_png"
    "$sha_desktop"
)

package() {
    cd "$srcdir"
    
    install -Dm644 "v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "v2raya" -t "$pkgdir/usr/bin/"

    install -Dm644 "v2raya.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "v2raya.desktop" -t "$pkgdir/usr/share/applications/"
}
