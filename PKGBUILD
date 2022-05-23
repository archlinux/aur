pkgname="ttf-victor-mono"
pkgdesc="Unoffical Victor Mono(TTF) AUR package"
pkgver=1.5.3
pkgrel=1
arch=("any")
sha256sums=("839aa255ca6554430b6be353338431485e9c1452545c278161cc108a7ee7b1ab")
url="https://rubjo.github.io/victor-mono/"
source=("https://rubjo.github.io/victor-mono/VictorMonoAll.zip")
license=("custom:OFL")

package(){
   if [[ ! -d "$pkgdir/usr/share/fonts/TTF" ]]; then
	   mkdir -p $pkgdir/usr/share/fonts/TTF
   fi
   install -Dm644 TTF/*.ttf $pkgdir/usr/share/fonts/TTF/
}

