pkgname=kwin-scripts-force-decorations-gtk3
pkgver=0.2
pkgrel=1
pkgdesc="Force server-side decorations for a list of common GTK+ 3 applications which use client-side decorations."
arch=('any')
url='https://store.kde.org/p/1235093'
license=("custom:unknown")
depends=('kwin')
source=("force-decorations-gtk3.kwinscript")
sha512sums=('884050eaa8b665e2ec7d12ee73b8936cf1bb6708ec1aa341944d45022397a644c0760fd996eceb466ddb256bbb6e3715f854289cadf1efc4d40886ec5b06274d')

package() {
	plasmapkg2 -t kwinscript -p $pkgdir/usr/share/kwin/scripts -i force-decorations-gtk3.kwinscript
}
