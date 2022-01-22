pkgname="ttf-victor-mono"
pkgdesc="Unoffical Victor Mono(TTF) AUR package"
pkgver=1.5.2
pkgrel=1
arch=("any")
sha256sums=("090cbcf1d95f147da981173f30d481386ae065480dfe150d8a0a287fb0bcc256")
url="https://rubjo.github.io/victor-mono/"
source=("https://rubjo.github.io/victor-mono/VictorMonoAll.zip")
license=("custom:OFL")

package(){
   if [[ ! -d "$pkgdir/usr/share/fonts/TTF" ]]; then
	   mkdir -p $pkgdir/usr/share/fonts/TTF
   fi
   install -Dm644 TTF/*.ttf $pkgdir/usr/share/fonts/TTF/
}

