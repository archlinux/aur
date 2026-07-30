pkgname=emmy-lua-code-style-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="EmmyLuaCodeStyle: project is an example of Lua code analysis\formatting\code diagnosis algorithm library and language service based on C++"
arch=('x86_64')
url="https://github.com/CppCXY/EmmyLuaCodeStyle"
license=("MIT License")
source_x86_64=("https://github.com/CppCXY/EmmyLuaCodeStyle/releases/download/${pkgver}/linux-x64.tar.gz")
sha256sums_x86_64=('ce712ffecb697c2019c0602665cc58276c2559c0a0f3d319b2ade4c539faecce')
depends=()
provides=('emmy-lua-code-style')
confilcts=()

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/linux-x64/bin" "$pkgdir/usr"
    cp -r "$srcdir/linux-x64/lib" "$pkgdir/usr"
}
