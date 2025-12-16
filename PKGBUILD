# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=lzbench-bin
_name=${pkgname%-bin}
pkgver=2.2
pkgrel=1
pkgdesc='An in-memory benchmark of open-source compressors'
arch=('aarch64' 'x86_64')
url='https://github.com/inikep/lzbench'
license=(
    '0BSD'
    'Apache-2.0'
    'BSD-2-Clause'
    'BSD-3-Clause'
    'CC0-1.0'
    'CDDL-1.0'
    'GPL-1.0-or-later'
    'GPL-2.0-only'
    'GPL-2.0-or-later'
    'GPL-3.0-only'
    'GPL-3.0-or-later'
    'LGPL-2.1-or-later'
    'LGPL-3.0-or-later'
    'MIT'
    'Unlicense'
    'Zlib'
    'LicenseRef-bzip2-1.0.6'
)
provides=("$_name")
conflicts=("$_name")
source=("$_name-$pkgver.tar.gz::https://github.com/inikep/lzbench/archive/refs/tags/v$pkgver.tar.gz")
source_aarch64=("$_name-$pkgver-aarch64.gz::https://github.com/inikep/lzbench/releases/download/v$pkgver/lzbench${pkgver//.}_aarch64-linux-gnu-gcc13.gz")
source_x86_64=("$_name-$pkgver-x86_64.gz::https://github.com/inikep/lzbench/releases/download/v$pkgver/lzbench${pkgver//.}_x86_64-linux-gnu-gcc14.gz")
sha256sums=('c6b8043d7e0c228c2e8fe18af1ea682a84f1019b8115111861738a0313487201')
sha256sums_aarch64=('dec7c12130abf8006c8f9398f51e3ebbf26aa319b943a2b5a177609585bbf815')
sha256sums_x86_64=('5282a539a9b06c8f6032a6292eb1bb6549672a2f86be0888554662bd25630e73')
b2sums=('69389958cb2016a1dbbd462fff603057339d772902b055b8299f6759f1f9a8cbadf31489254bb93f967ca6863e2db32e8da8bfe429cf5dfc4a4b61280164f4e5')
b2sums_aarch64=('368dbe737dbfedf284b89314f737081950f911135a3ce2393954502c3610cd5fc95d363b2c812beec7cb60408e36a3dc58099b5d3121c17277054631e5e0535f')
b2sums_x86_64=('3532e8130efbe7cba2f34e8cfb4412d6ec1ed637dbf6d1013ae6bc8024af8c771b84e75e767ea59c1177bd232d7eecc3bb42523f0dc263154d9a0e399e64b54e')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/lzbench"

    install -Dm644 $_name-$pkgver/doc/lzbench.7.txt "$pkgdir/usr/share/man/man7/lzbench.7"

    install -Dm644 $_name-$pkgver/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver/bwt/bzip2/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/bzip2-LICENSE"
    install -Dm644 $_name-$pkgver/lz/brieflz/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/brieflz-LICENSE"
    install -Dm644 $_name-$pkgver/lz/brotli/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/brotli-LICENSE"
    install -Dm644 $_name-$pkgver/lz/fast-lzma2/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/fast-lzma2-LICENSE"
    install -Dm644 $_name-$pkgver/lz/gipfeli/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/gipfeli-COPYING"
    install -Dm644 $_name-$pkgver/lz/libdeflate/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/libdeflate-COPYING"
    install -Dm644 $_name-$pkgver/lz/lizard/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/lizard-LICENSE"
    install -Dm644 $_name-$pkgver/lz/lz4/lib/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/lz4-LICENSE"
    install -Dm644 $_name-$pkgver/lz/lzav/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/lzav-LICENSE"
    install -Dm644 $_name-$pkgver/lz/lzfse/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/lzfse-LICENSE"
    install -Dm644 $_name-$pkgver/lz/lzsse/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/lzsse-LICENSE"
    install -Dm644 $_name-$pkgver/lz/snappy/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/snappy-COPYING"
    install -Dm644 $_name-$pkgver/lz/zstd/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/zstd-LICENSE"
    install -Dm644 $_name-$pkgver/lz/xz/COPYING.0BSD \
        "$pkgdir/usr/share/licenses/$pkgname/xz-COPYING.0BSD"
    install -Dm644 $_name-$pkgver/lz/lzlib/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/lzlib-COPYING"
    install -Dm644 $_name-$pkgver/lz/slz/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/slz-LICENSE"
    install -Dm644 $_name-$pkgver/lz/zlib/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/zlib-LICENSE"
    install -Dm644 $_name-$pkgver/lz/zlib-ng/LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/zlib-ng-LICENSE"
    install -Dm644 $_name-$pkgver/misc/density/src/LICENSE-MIT \
        "$pkgdir/usr/share/licenses/$pkgname/density-LICENSE-MIT"
    install -Dm644 $_name-$pkgver/misc/zpaq/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/zpaq-COPYING"
}
