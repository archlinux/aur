pkgname="ttf-victor-mono"
pkgdesc="Unoffical Victor Mono(TTF) AUR package"
pkgver=1.5.6
pkgrel=1
arch=("any")
sha256sums=("eab377ad3bcc7a202697c024ebb8c8728f99789c4f093d358f3d202052cc9496")
url="https://rubjo.github.io/victor-mono/"
source=("https://rubjo.github.io/victor-mono/VictorMonoAll.zip")
license=("custom:OFL")

package(){
   if [[ ! -d "$pkgdir/usr/share/fonts/TTF" ]]; then
	  mkdir -p $pkgdir/usr/share/fonts/TTF
   fi
   install -Dm644 TTF/*.ttf $pkgdir/usr/share/fonts/TTF/
}
