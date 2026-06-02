pkgname="echobird-bin"
pkgver="5.1.5"
pkgrel="1"
pkgdesc="One-Click Install All"
arch=('x86_64' 'aarch64')
url="https://echobird.ai/"
license=("BUSL-1.1")
depends=("glibc")

source_x86_64=("https://github.com/edison7009/EchoBird/releases/download/v$pkgver/EchoBird_${pkgver}_Linux_x64.rpm")
source_aarch64=("https://github.com/edison7009/EchoBird/releases/download/v$pkgver/EchoBird_${pkgver}_Linux_arm64.rpm")
sha256sums_x86_64=('ebd2c13987f676b337d7096f29c9ed52acc109223eb9fff15ee3d7049d1bda7e')
sha256sums_aarch64=('6b6f3a102bf6ef59e645e467bc2d1612883ecc01a499e1311a3591cef4d8df41')

package() {
    cp -r "$srcdir/usr" "$pkgdir"
}
