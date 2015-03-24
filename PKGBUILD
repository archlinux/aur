# Maintainer: Philipp Klein <philipptheklein@gmail.com>
pkgname=gdrive
pkgver=1.6.1
pkgrel=1
pkgdesc="Command line utility for uploading and downloading single files to your Google Drive"
arch=('i686' 'x86_64')
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
source_i686=("gdrive-linux-i686::https://drive.google.com/uc?id=0B3X9GlR6EmbnZ1JESlBlX2s4XzQ")
source_x86_64=("gdrive-linux-x86_64::https://drive.google.com/uc?id=0B3X9GlR6EmbnSWFxaExoUEk1NFk")
noextract=()
sha256sums=('141e360fe52a5f5a873ac9c49a08d2f50bce82212a8c8d6196a91b79820dd717')
sha256sums_i686=('ae89a67e35a3426c6ad969c61973b06202a3b23134269bce577c824ea2ad2ccc')
sha256sums_x86_64=('52f7a20707e63868b7d1d8a458c1942f876d472f414b982d0f5164458d20bc2a')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/licenses/gdrive"
    install -m755 "$srcdir/gdrive-linux-$CARCH" "$pkgdir/usr/bin/gdrive"
    install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gdrive"
}

# vim:sw=4:ts=4:et
