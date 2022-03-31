# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=master-208096c1
pkgname=clang-format-static-bin
pkgver=8.208096c1
pkgrel=1
pkgdesc="clang-format x86_64 static binaries (3.9, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12.0.1, 13, 14)"
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
        "${_gittag}-LICENSE.TXT.clang-8-and-lower::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-8-and-lower"
        "${_gittag}-LICENSE.TXT.clang-9-and-higher::https://github.com/muttleyxd/clang-format-static-binaries/releases/download/$_gittag/LICENSE.TXT.clang-9-and-higher")
sha256sums=('6fe5f05f710d6c02a0c9d7af6aaa15a5353bff4142a622dc45dd1fd591ab9ce0'
            '63878d91ddf6de7ab7c7aae4c7c9d0ecb652ef53b5e34bcf24a00fb2b91493d9'
            '9484d40f396e2c08c24d052f1ad026b28d12df007f3615c72806543142ea1eaa'
            '76c6201c9b0f4a141da283ae9e20767ec763aff5b5a923bd26c987e65097c11b'
            '35b42347aa9f24aa7a308808e1ec004d3283ddd27a78c9e3fd454c5b83a50310'
            '62f9d8e1cb29e7fdb2def4c5a1a4764bf160d3e234915e419527afa1224e8be7'
            '32999e873470769d18c69789277b8e915605edc142d6c53b7312bcc9148309a0'
            'd8eef9c421ae5625e74d57f71b0fc8f4a8f469481ef019167debb912908c1f8c'
            '0a34bbbcf651cd37a0faa3aae8f865815b122539d21c50834a0802ae57a92e73'
            '193523f36f38a28d00509fa62782ae5cb54f4cff6059279ef9874f0d9dd6ab88'
            'e2e3022a05410fade1ed646d65f64e8f54b039252e1643b6ac564639c9dd61fa'
            '78ef2a4362079abf19712cd6875661cc38b1d036ce0a45174e147eee6859914f'
            '591e640090bd5a9ec8ff9f36c5bc3f6328b1d279dc32b9d6b62771d5d895637f'
            '9019f7d4903d790e6da6ebf3dcf633dc45b6588fcd81f843afc67fda5c018391'
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
}
