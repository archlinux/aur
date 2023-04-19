pkgname="ttf-victor-mono"
pkgdesc="Unoffical Victor Mono(TTF) AUR package"
pkgver=1.5.5
pkgrel=1
arch=("any")
sha256sums=("34288e16ca4834efc721aaf0c6f4ef3d86a85a5a791769787b50853ec21afd3b")
url="https://rubjo.github.io/victor-mono/"
source=("https://rubjo.github.io/victor-mono/VictorMonoAll.zip")
license=("custom:OFL")

package(){
   if [[ ! -d "$pkgdir/usr/share/fonts/TTF" ]]; then
	  mkdir -p $pkgdir/usr/share/fonts/TTF
   fi
   install -Dm644 TTF/*.ttf $pkgdir/usr/share/fonts/TTF/
}
