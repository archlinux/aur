# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>
pkgname=system76-wallpapers
pkgver=18.04.2~1611351210~22.04~52abc1e~dev
pkgrel=2
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://github.com/pop-os/system76-wallpapers"
license=('LGPL-2.0-or-later')
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+sourcefiles/$pkgname/$pkgver/${pkgname}_${pkgver}"{.tar.xz,.dsc})
sha256sums=('11087fc9f1728f5a269eabecd3321a2761d95488fbed7a2aeabc64f0350483ed'
            'f16709261e150413468532228b44ccb3b4435adb4733fe74e88577bf2cae16d7')
validpgpkeys=('63C46DF0140D738961429F4E204DD8AEC33A7AFF') # Pop OS (ISO Signing Key) <info@system76.com>

package() {
  install -Dm644 archive/backgrounds/* -t "$pkgdir/usr/share/backgrounds"
  install -Dm644 "archive/$pkgname.xml" -t "$pkgdir/usr/share/gnome-background-properties"
}
