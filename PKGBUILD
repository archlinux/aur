# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: bgh <aur at bgh dot io>

pkgname="cyberchef-web"
pkgver=10.7.0
pkgrel=1
pkgdesc="The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis"
url="https://gchq.github.io/CyberChef/"
license=("Apache-2.0")
arch=("any")
conflicts=("cyberchef-html")
replaces=("cyberchef-html")
makedepends=("unzip")
source=("$pkgname-$pkgver.zip::https://github.com/gchq/CyberChef/releases/download/v$pkgver/CyberChef_v$pkgver.zip")
noextract=("$pkgname-$pkgver.zip")
b2sums=('151f96b58f9a188cacb3958a862bd069e8a3e4274af2223b02e50a718b7848f4db18cb8e8586960ac80bb92f771fde186dede24a33a1be8260f943ab26278af5')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps"
 unzip -q -o "$pkgname-$pkgver.zip" -d "$pkgdir/usr/share/webapps/cyberchef"
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
}

