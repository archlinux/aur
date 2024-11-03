pkgname=smbx-assets
_pkgname=SMBX-assets
pkgver=1.3.6.6
pkgrel=1
pkgdesc="SMBX assets"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('unzip')
source=("$url/releases/download/v$pkgver/thextech-smbx13-assets-full-v$pkgver.7z")
sha256sums=('9b74471abd53b0cb8f2ec63f928235b0eb460467c86392a4384ddeec808060c0')

package() {
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"

    # Packaging files
    cd $srcdir
    rm -rf thextech-smbx13-assets-full.7z
    cp -r * "$pkgdir/usr/share/games/$_pkgname"
}
