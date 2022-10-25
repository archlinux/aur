# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=master-1d7ec53d
pkgname=clang-format-static-bin
pkgver=9.1d7ec53d
pkgrel=1
pkgdesc="clang-format x86_64 static binaries (3.9, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12.0.1, 13, 14, 15)"
arch=('x86_64')
url="https://github.com/muttleyxd/clang-format-static-binaries"
license=('Unlicense')
provides=('clang-format-static')
conflicts=('clang-format-static')
install=$pkgname.install
source=("archlinux-clang-format"
        "${_gittag}-clang-format-3.9::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-3.9_linux-amd64"
        "${_gittag}-clang-format-4::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-4_linux-amd64"
        "${_gittag}-clang-format-5::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-5_linux-amd64"
        "${_gittag}-clang-format-6::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-6_linux-amd64"
        "${_gittag}-clang-format-7::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-7_linux-amd64"
        "${_gittag}-clang-format-8::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-8_linux-amd64"
        "${_gittag}-clang-format-9::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-9_linux-amd64"
        "${_gittag}-clang-format-10::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-10_linux-amd64"
        "${_gittag}-clang-format-11::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-11_linux-amd64"
        "${_gittag}-clang-format-12::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-12_linux-amd64"
        "${_gittag}-clang-format-12.0.1::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-12.0.1_linux-amd64"
        "${_gittag}-clang-format-13::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-13_linux-amd64"
        "${_gittag}-clang-format-14::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-14_linux-amd64"
        "${_gittag}-clang-format-15::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/clang-format-15_linux-amd64"
        "${_gittag}-LICENSE.TXT.clang-8-and-lower::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-8-and-lower"
        "${_gittag}-LICENSE.TXT.clang-9-and-higher::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-9-and-higher")
sha256sums=('6fe5f05f710d6c02a0c9d7af6aaa15a5353bff4142a622dc45dd1fd591ab9ce0'
            'b3e478cb2c9ee8dea6408aca59ede3c738afd5b714a8967e6cc9e2b0568f47c1'
            'feed3f13a07bc62018ffc563b6bfabf060d19669c79c4bb4e4057c9d67738392'
            '09e4486a6e6345d2f5f892c332ba1d67fba1878e376de160979222e9bea76fee'
            '624f90fd622102b6aa08affe055d8c18fdcafe013c7f01db18ffb55cd661bf04'
            '39df0452de5fb04967b2e1f4e0733c79772cecb98ff2fdee512e02f73bf534f2'
            '579dd9cf576c6827f91f11ee81cb513b4900ad65f4af0b3e6bbe0553aec536de'
            'b38a580d68848d21d10f65f34f27fcd863ed7407114b90fde80cb46e56aec8c1'
            '8d6ff8fb206c24c77818cc3a5e74c7bc44ff937348ac956c9a8e1e5c3eedd6fd'
            'a9d76e3275823ea308bc2e4d2a6e3cc693f38c29d891f1d74cb0e1553e698dea'
            '3b0b2b7c5a86b34a304a27a6633d4daa463c7729a821bc918e4f2f5c1d68f0f1'
            '11dec801824bd6a5124f8c5e46db7dfe6f295738e09179ba190b1a4be71f1359'
            'd85c52e54b16be75336e83ed6abc905eebb78b19c39edf027241db922592fca8'
            'e5e79e66cc7454b2497ff7cdf44b6e0157ec618abdbb3b86826870d10deaa06d'
            '37d9cc769a58146c481639ab297af446ca10a5dd4a6fecae2501e8b35e14b6c1'
            '2050acfe8b8d5ae1ef971b6ab419cd9f46e3f2d779a09966105622b3112600d9'
            'ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47')

package()
{
    mkdir -p "$pkgdir/opt/clang-format-static"
    mkdir -p "$pkgdir/usr/bin"
    cp -L "$srcdir/archlinux-clang-format" "$pkgdir/usr/bin/archlinux-clang-format"
    cp -L "$srcdir/${_gittag}-clang-format-3.9" "$pkgdir/opt/clang-format-static/clang-format-3.9"
    cp -L "$srcdir/${_gittag}-clang-format-4" "$pkgdir/opt/clang-format-static/clang-format-4"
    cp -L "$srcdir/${_gittag}-clang-format-5" "$pkgdir/opt/clang-format-static/clang-format-5"
    cp -L "$srcdir/${_gittag}-clang-format-6" "$pkgdir/opt/clang-format-static/clang-format-6"
    cp -L "$srcdir/${_gittag}-clang-format-7" "$pkgdir/opt/clang-format-static/clang-format-7"
    cp -L "$srcdir/${_gittag}-clang-format-8" "$pkgdir/opt/clang-format-static/clang-format-8"
    cp -L "$srcdir/${_gittag}-clang-format-9" "$pkgdir/opt/clang-format-static/clang-format-9"
    cp -L "$srcdir/${_gittag}-clang-format-10" "$pkgdir/opt/clang-format-static/clang-format-10"
    cp -L "$srcdir/${_gittag}-clang-format-11" "$pkgdir/opt/clang-format-static/clang-format-11"
    cp -L "$srcdir/${_gittag}-clang-format-12" "$pkgdir/opt/clang-format-static/clang-format-12"
    cp -L "$srcdir/${_gittag}-clang-format-12.0.1" "$pkgdir/opt/clang-format-static/clang-format-12.0.1"
    cp -L "$srcdir/${_gittag}-clang-format-13" "$pkgdir/opt/clang-format-static/clang-format-13"
    cp -L "$srcdir/${_gittag}-clang-format-14" "$pkgdir/opt/clang-format-static/clang-format-14"
    cp -L "$srcdir/${_gittag}-clang-format-15" "$pkgdir/opt/clang-format-static/clang-format-15"
    cp -L "$srcdir/${_gittag}-LICENSE.TXT.clang-8-and-lower" "$pkgdir/opt/clang-format-static/LICENSE.TXT.clang-8-and-lower"
    cp -L "$srcdir/${_gittag}-LICENSE.TXT.clang-9-and-higher" "$pkgdir/opt/clang-format-static/LICENSE.TXT.clang-9-and-higher"
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
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-12.0.1"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-13"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-14"
    chmod 755 "$pkgdir/opt/clang-format-static/clang-format-15"
}
