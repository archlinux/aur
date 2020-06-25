# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=master-5b56bb49
pkgname=clang-format-static-bin
pkgver=3.5b56bb49
pkgrel=3
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
sha256sums=('2f34b784dc99e6ebc9e9af6e6eb0bef9a035b98dc67d56adc79307cca467df43'
            '0127f653a16191aa1cc41f4ea79d7014141ecfcda1c85091bdccb750703d5dda'
            '86a0582ff8ea3b1f471df98d93093fd4b5e717f9188d67bd09c4cee3a4412a53'
            'da2c9fa70fb1e9a4fafa74b20291f0772578378e8d2a4ca6fbf5e88c63ebde2a'
            'b5a00c0d16d49955e223240df0215474aeeef7ce15f4e2c1cab77f34fa71821e'
            '3c9dadba9929af5bdd21c0db743ea0a600cd59ab089b48aab4a435ff601e05dc'
            'f0ed013b4a5b404c45ab89c0c434e84a824b8ba0880c28cce11ebc79cd974cfb'
            'bcea4e9aa5088db7778e1d5ece6fd14c75648dfbd725568524942d46ed18da54'
            'e4268dfe6aae8c160791af86eed0cd04e737b5dc0a47c71291f3a9a28e4fd574'
            '2050acfe8b8d5ae1ef971b6ab419cd9f46e3f2d779a09966105622b3112600d9'
            'ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47')

package()
{
    mkdir -p "$pkgdir/opt/clang-format-static"
    cp -L "$srcdir/archlinux-clang-format" "$pkgdir/opt/clang-format-static/archlinux-clang-format"
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
