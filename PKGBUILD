pkgname=code-format-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="EmmyLuaCodeStyle: project is an example of Lua code analysis\formatting\code diagnosis algorithm library and language service based on C++"
arch=('x86_64')
url="https://github.com/CppCXY/EmmyLuaCodeStyle"
license=("MIT License")
source_x86_64=("https://github.com/CppCXY/EmmyLuaCodeStyle/releases/download/${pkgver}/linux-x64.tar.gz")
sha256sums_x86_64=('2540e3268ad1327e5e83962f835379445f2452ba76164b9eddcc409e922bd4c0')
depends=()
provides=('code-format')
confilcts=()

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/linux-x64/bin" "$pkgdir/usr"
}
