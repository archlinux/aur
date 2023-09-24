# Maintainer: Andrew Ryan <dnrops@outlook.com>
#
pkgname=cyberchef-web-cn-git
_pkgname="cyberchef-web"
pkgver=10.5.2
pkgrel=1
pkgdesc="The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis"
url="https://gchq.github.io/CyberChef/"
license=("Apache 2.0")
arch=("any")
conflicts=("cyberchef-html")
replaces=("cyberchef-html")
makedepends=("unzip")
source=("$pkgname-$pkgver.zip::https://gitcode.net/dnrops/cyberchef-web/-/raw/master/CyberChef_v10.5.2.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('SKIP')
options=("!strip")
echo "github.com/gchq/CyberChef/releases/download/v$pkgver/CyberChef_v$pkgver.zip"
package(){
 install -d "$pkgdir/usr/share/webapps"
 unzip -q -o "$pkgname-$pkgver.zip" -d "$pkgdir/usr/share/webapps/cyberchef"
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
}