# Maintainer: Michael Rydén (zynex(at)ezmail.se)
# App: RenameMyTVSeries
# Version: 2.0.6
# Webpage: https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/

pkgname=renamemytvseries-bin
_pgmname=RenameMyTVSeries
pkgver=2.0.10
pkgrel=1
pkgdesc="Rename your TV-Series using TheTVDB"
arch=('x86_64')
provides=('renamemytvseries')
conflicts=('renamemytvseries')
url="https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/"
license=('custom')

source=('LICENSE' 'RenameMyTVSeries.sh' 'RenameMyTVSeries.desktop' 'https://www.tweaking4all.com/RenameMyTVSeries2.tar.gz')

md5sums=('c6618071446e1528f9080cbb2eb5913a'
         '21641c4c01d8c31845b32bd9d11e92d6'
         '4348d64bef9cee3f50f9d908e72c46dd'
         'SKIP')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/$_pgmname"
  install -Dm755 "$srcdir/ffprobe" "$pkgdir/opt/$_pgmname/"
  install -Dm755 "$srcdir/RenameMyTVSeries" "$pkgdir/opt/$_pgmname/"
  install -Dm644 "$srcdir/icons/16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pgmname.png"
  install -Dm644 "$srcdir/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pgmname.png"
  install -Dm644 "$srcdir/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pgmname.png"
  install -Dm644 "$srcdir/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pgmname.png"
  install -Dm644 "$srcdir/icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pgmname.png"
  install -Dm755 "$srcdir/$_pgmname.sh" "$pkgdir/usr/bin/$_pgmname"
  install -Dm644 "$srcdir/$_pgmname.desktop" "$pkgdir/usr/share/applications/$_pgmname.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pgmname/LICENSE"
}
