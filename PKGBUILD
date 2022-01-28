# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="keeweb-web"
pkgver=1.18.7
pkgrel=1
pkgdesc="Free cross-platform password manager compatible with KeePass"
url="https://keeweb.info/"
license=("MIT")
arch=("any")
conflicts=("keeweb-html")
replaces=("keeweb-html")
makedepends=("unzip")
source=("$pkgname-$pkgver.zip::https://github.com/keeweb/keeweb/releases/download/v$pkgver/KeeWeb-$pkgver.html.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('6f3d06891117072e62b43b08a84bdaf4fc43c0aae6127ac6c2e7564299d8a890')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps"
 unzip -q -o "$pkgname-$pkgver.zip" -d "$pkgdir/usr/share/webapps/keeweb"
}

