pkgname=code-format-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="EmmyLuaCodeStyle: project is an example of Lua code analysis\formatting\code diagnosis algorithm library and language service based on C++"
arch=('x86_64')
url="https://github.com/CppCXY/EmmyLuaCodeStyle"
license=("MIT License")
source_x86_64=("https://github.com/CppCXY/EmmyLuaCodeStyle/releases/download/${pkgver}/linux-x64.tar.gz")
sha256sums_x86_64=('f23e71501ed2352ca86486275918f3e657acf650cf3d595fcf8b01a2896245e5')
depends=()
provides=('code-format')
confilcts=()

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/linux-x64/bin" "$pkgdir/usr"
}
