# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>
pkgname=system76-wallpapers
pkgver=18.04.2~1761578402~26.04~c9a5b39
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://github.com/pop-os/system76-wallpapers"
license=('CC-BY-SA-4.0')
options=('!strip')
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+sourcefiles/$pkgname/${pkgver}~dev/${pkgname}_${pkgver}~dev.tar.xz")
sha256sums=('0dd53fdfdf3984739b0a187ad1ad5d17e97724c20ead1b9c33350b4041207566')

package() {
  install -Dm644 archive/backgrounds/* -t "$pkgdir/usr/share/backgrounds/"
  install -Dm644 "archive/$pkgname.xml" -t "$pkgdir/usr/share/gnome-background-properties/"
}
