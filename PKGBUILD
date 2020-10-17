# Maintainer: SimonK <Sallad9707@gmail.com>
pkgname=wurm-launcher
pkgver=1.0
pkgrel=2
pkgdesc="Launcher for sandbox mmorpg Wurm Online"
arch=(x86_64)
url="https://www.wurmonline.com/"
license=('unknown')
source=("https://client.wurmonline.com/client/wurmlauncher.tar.gz" 
		"https://github.com/Sallad02/wurm-launcher-files/archive/1.0.tar.gz")
md5sums=('db194b15a6182c0b48f11bcefedbac55'
         '69cbd74e070b8dbea9dc28a18b6d34b8')

package() {
	mkdir -p $pkgdir/usr/share
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	cp -r $pkgname $pkgdir/usr/share
	cp $pkgname-files-$pkgver/src/$pkgname.sh $pkgdir/usr/bin
	cp $pkgname-files-$pkgver/src/$pkgname.desktop $pkgdir/usr/share/applications
	cp $pkgname-files-$pkgver/src/$pkgname.png $pkgdir/usr/share/$pkgname
}
