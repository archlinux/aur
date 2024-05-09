pkgname=smbx-assets
_pkgname=SMBX-assets
pkgver=1.3.6.5
pkgrel=1
pkgdesc="SMBX assets"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('unzip')
source=("$url/releases/download/v$pkgver/thextech-smbx13-assets-full.7z")
sha256sums=('f29ec757fdf3a06f7728dcb14f2d67e65a918026210128b9a203bc368e11da3a')

package() {
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"

    # Packaging files
    cd $srcdir
    rm -rf thextech-smbx13-assets-full.7z
    cp -r * "$pkgdir/usr/share/games/$_pkgname"
}
