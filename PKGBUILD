# Maintainer: Tarik Celik <tarikcelik@tutamail.com>

pkgname="odin-flash-tool"
pkgver=4
pkgrel=4
pkgdesc=""
arch=("x86_64")
license=("MIT")
depends=()
makedepends=(unzip)
optdepends=()
source=("https://github.com/Adrilaw/OdinV4/releases/download/v1.0/odin.zip")
md5sums=("SKIP")

#pkgver() {}

package() {
unzip odin.zip
chmod +x odin4
sudo cp odin4 -t /usr/bin/
}
