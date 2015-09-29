# Maintainer: Philipp Klein <philipptheklein@gmail.com>
pkgname=gdrive
pkgver=1.9.0
pkgrel=1
pkgdesc="Command line utility for uploading and downloading single files to your Google Drive"
arch=('x86_64' 'i686')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("LICENSE")
source_i686=("gdrive-linux-i686::https://drive.google.com/uc?id=0B3X9GlR6EmbnUWZGRmYxVUU2M00")
source_x86_64=("gdrive-linux-x86_64::https://drive.google.com/uc?id=0B3X9GlR6Embnb095MGxEYmJhY2c")
noextract=()
sha256sums=('141e360fe52a5f5a873ac9c49a08d2f50bce82212a8c8d6196a91b79820dd717')
sha256sums_x86_64=('51760311fcd987b6f52e5a5ce166e2bc3c4f009e00ed3d7fa5d183d141328e0f')
sha256sums_i686=('f964a52dd3f2dadb00dea8346de93870a69291a1cc13420a9690edf4c4eda8f3')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m755 "$srcdir/gdrive-linux-$CARCH" "$pkgdir/usr/bin/$pkgname"
    install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:sw=4:ts=4:et
