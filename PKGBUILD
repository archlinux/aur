# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="cyberchef-web"
pkgver=9.48.0
pkgrel=1
pkgdesc="The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis"
url="https://gchq.github.io/CyberChef/"
license=("Apache 2.0")
arch=("any")
conflicts=("cyberchef-html")
replaces=("cyberchef-html")
makedepends=("unzip")
source=("$pkgname-$pkgver.zip::https://github.com/gchq/CyberChef/releases/download/v$pkgver/CyberChef_v$pkgver.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('ce99537f5850904e6cd431bf48ef71896c9de69a12be1572f2f0582ad1e06504')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps"
 unzip -q -o "$pkgname-$pkgver.zip" -d "$pkgdir/usr/share/webapps/cyberchef"
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
}

