# Maintainer: Kenneth Cremeans <kcrem@hfhosting.us>

pkgname=lbry-app-release
pkgver=0.22.0
pkgrel=1
pkgdesc='The LBRY Application built on Electron framework'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.22.0/LBRY_0.22.0.deb')
sha256sums=('c813116cdcbd2863d7f6215d9dcc17358dc761d1478c12945648e79c66626803')

package()  {
tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
