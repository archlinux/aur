pkgname=adventuresofdemo-assets
_pkgname=AdventuresofDemo-assets
pkgver=1.3.6.3
pkgrel=1
pkgdesc="Adventures of Demo assets"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('unzip')
source=("https://github.com/Wohlstand/TheXTech/releases/download/v$pkgver/thextech-adventure-of-demo-assets-full.7z")
sha256sums=("SKIP")

package() {
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"

    # Packaging files
    cd $srcdir
    for dir in *; do
      if [[ -d "$dir" ]]; then
      cp -r "$dir" "$pkgdir/usr/share/games/$_pkgname"
     fi
    done
    cp *.{txt,ini,lvlx} "$pkgdir/usr/share/games/$_pkgname"
}
