# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=master-22538c65
pkgname=clang-format-static-bin
pkgver=4.22538c5
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
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-8-and-lower"
        "https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-9-and-higher")
sha256sums=('cba2926c0b1983332ef1db7921714f3f6f5f8acb46532319ef566919f141cfa8'
            '74aa2f6b1656d902e1036c54b75c0faed8d8f41f73cb7290524fc19c1389c9d6'
            '2324e49614ed84859771692dfeff305cf22135cd3144056246b776d813898e78'
            '7f2d43c263e62e2c52162c3e274d607349b9492ade8e16e338f19f5f1f74ea55'
            '00a5da6cb1a2d011cb353cf8157a6d14e0a7a113996a86e32fa83141a583c27e'
            'eaef02e7e2505a186ac4e1a6066a41c129351c532a25a80f6f47c4b5eb80dca1'
            '892e43c8efbc0f2587655c9c8d450979a3864630bbc4871cc44ed8e4b0e80d68'
            '35c9250ccbce1c1d39f2917faef45003e06391be8d631006bcf3f9e2aa59fd6d'
            '974b20a021fe1a9758b525eace834325ad50aa828f842dbbc620a516ae33fb9e'
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
}
