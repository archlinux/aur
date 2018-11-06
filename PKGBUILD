# Maintainer: Nicolas Modrzyk <hellonico at gmail dot com>

pkgname=origamiapp
pkgver=2.0.0
pkgrel=1
pkgdesc="Origami Application (OpenCV Wrapper in Clojure)"
arch=('x86_64')
url="https://github.com/hellonico/origami-electron"
license=('EPL')
 
source=("https://github.com/hellonico/origami-electron/releases/download/2.0/origamiapp-linux-x64.zip")
#noextract=("${source[@]%%::*}")
md5sums=('be96f548476200d407036dd3e4d559f5')

package() {
        mkdir -p "$pkgdir"/usr/share/origamiapp
        mkdir -p "$pkgdir/usr/bin/"
        #install -D "$srcdir"/origamiapp-linux-x64/* "$pkgdir"/usr/share/origamiapp
        #/home/niko/projects/origamiapp/src/origamiapp-linux-x64/resources
        cp -r "$srcdir"/origamiapp-linux-x64/* "$pkgdir"/usr/share/"$pkgname"
        ln -s "$pkgdir"/usr/share/"$pkgname"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
