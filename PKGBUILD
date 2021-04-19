# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=master-6fce707f
pkgname=clang-format-static-bin
pkgver=5.6fce707f
pkgrel=1
pkgdesc="clang-format x86_64 static binaries (3.9, 4, 5, 6, 7, 8, 9, 10)"
arch=('x86_64')
url="https://github.com/muttleyxd/clang-format-static-binaries"
license=('Unlicense')
provides=('clang-format-static')
conflicts=('clang-format-static')
install=$pkgname.install
source=("archlinux-clang-format"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-3.9_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-4_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-5_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-6_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-7_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-8_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-9_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-10_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-11_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-12_linux-amd64"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-8-and-lower"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-9-and-higher")
sha256sums=('cba2926c0b1983332ef1db7921714f3f6f5f8acb46532319ef566919f141cfa8'
            '8a6c41508f123b442ce4ce06c2853de61d24e9654754c1bbc002c9168ed16064'
            'f5634dac601ad613107b152f17f2363b0d9a79ef3850a25ec5bab09a3e6abae4'
            'b449a152fb3cdd7c2c83b9473d1db2a26401f9095d024fce48f812d62b149b1d'
            '15b6d6a00a2ed8c24c2f53376bd3f73c9e8e7a1886fdae8f50b3b2b8d7461192'
            '0aa8b480741e1b6c0ccff4eab1a513bae7f1b063801af3fcb38074e9b35f1965'
            '8bcec29c91e9600743e6ae85f5e15e67b9ab95d06d91275082459c14fe93e40e'
            'dc07cdfba65a00130a949e81dc78db2f0c78b14a0215da430601198700c7394d'
            '28fdc0753750d70ab4055ef49645da714ee5eb0e5de417941ebac2513306d046'
            '935805b50723f7ab5946979a09bfad11adff250450c8e1bf6784518d94246cce'
            '1944fee695bbad32f2a8807b2334209f0fa762ca9c5f015fe50b63d251b9939d'
            '2050acfe8b8d5ae1ef971b6ab419cd9f46e3f2d779a09966105622b3112600d9'
            'ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47')

package()
{
    mkdir -p "$pkgdir/opt/clang-format-static"
    mkdir -p "$pkgdir/usr/bin"
    cp -L "$srcdir/archlinux-clang-format" "$pkgdir/usr/bin/archlinux-clang-format"
    cp -L "$srcdir/clang-format-3.9_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-3.9"
    cp -L "$srcdir/clang-format-4_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-4"
    cp -L "$srcdir/clang-format-5_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-5"
    cp -L "$srcdir/clang-format-6_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-6"
    cp -L "$srcdir/clang-format-7_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-7"
    cp -L "$srcdir/clang-format-8_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-8"
    cp -L "$srcdir/clang-format-9_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-9"
    cp -L "$srcdir/clang-format-10_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-10"
    cp -L "$srcdir/clang-format-11_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-11"
    cp -L "$srcdir/clang-format-12_linux-amd64" "$pkgdir/opt/clang-format-static/clang-format-12"
    cp -L "$srcdir/LICENSE.TXT.clang-8-and-lower" "$pkgdir/opt/clang-format-static/LICENSE.TXT.clang-8-and-lower"
    cp -L "$srcdir/LICENSE.TXT.clang-9-and-higher" "$pkgdir/opt/clang-format-static/LICENSE.TXT.clang-9-and-higher"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-3.9"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-4"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-5"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-6"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-7"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-8"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-9"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-10"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-11"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-12"
}
