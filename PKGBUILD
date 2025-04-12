# Maintainer: RockinChaos

pkgname=shiru
pkgver=6.0.9
pkgrel=1
pkgdesc='BitTorrent streaming software with no paws in the way—watch anime in real-time, no waiting for downloads!'
arch=('x86_64')
url='https://github.com/RockinChaos/Shiru'
license=('GPL-3.0')
provides=('shiru')
options=('!strip')
source=('https://github.com/RockinChaos/Shiru/releases/download/v$pkgver/linux-Shiru-v$pkgver.AppImage'
        'shiru.png'
        'shiru.desktop')
sha256sums=('b53d2db5ccac2dc926670c6f783928720eaf411ede47459c5f0ffa9514e4f1eb'
            '379cccb8c101876ebfdab2684ed50a3e3ddb1e1250daca752bd24597bf7eaab3'
            '093eaeb028a2ee45f0107dd2ba251c2e9b537c49d467e92cb07f8c16bb265881')

package() {
  install -Dm755 '$srcdir/linux-Shiru-v$pkgver.AppImage' '$pkgdir/usr/bin/shiru'
  install -D '$srcdir/shiru.png' '$pkgdir/usr/share/icons/hicolor/256x256/apps/shiru.png'
  install -D '$srcdir/shiru.desktop' '$pkgdir/usr/share/applications/shiru.desktop'
}
