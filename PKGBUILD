# Maintainer: Jonghyo Lee <na1307@outlook.kr>
# Contributor: Giorgio Tani <giorgio.tani.software at gmail dot com>
pkgbase=peazip-additional-formats-plugin
pkgname=(peazip-additional-formats-plugin-{arc,lpaq,paq,quad,upx,zpaq})
pkgver=6
pkgrel=1
arch=(x86_64)
url="https://peazip.github.io"
groups=($pkgbase)
depends=(peazip)
source=("https://cyfuture.dl.sourceforge.net/project/peazip/Resources/PeaZip%20Additional%20Formats%20Plugin/peazip-additional-formats-plugin.$pkgver.LINUX.tar")
sha256sums=(d2ce07156ce170625008caf384b53bff9b087331d7e12ee711aa94a200316c84)

package_peazip-additional-formats-plugin-arc() {
  pkgdesc="Additional Formats Plugin for PeaZip (ARC)"
  license=(GPL-2.0-only)
  depends+=(lib32-glibc lib32-gcc-libs lib32-curl lib32-ncurses5-compat-libs lib32-gmp)

  cd "$srcdir/peazip-additional-formats-plugin.$pkgver.LINUX/arc"
  mkdir -p "$pkgdir/usr/lib/peazip/res/bin/arc"
  install -Dm644 * "$pkgdir/usr/lib/peazip/res/bin/arc/"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/arc/arc"
  mkdir -p "$pkgdir/usr/lib32"
  ln -sf "/usr/lib32/libgmp.so.10" "$pkgdir/usr/lib32/libgmp.so.3"
}

package_peazip-additional-formats-plugin-lpaq() {
  pkgdesc="Additional Formats Plugin for PeaZip (LPAQ)"
  license=(GPL-2.0-only)
  depends+=(lib32-glibc lib32-gcc-libs)

  cd "$srcdir/peazip-additional-formats-plugin.$pkgver.LINUX/lpaq"
  mkdir -p "$pkgdir/usr/lib/peazip/res/bin/lpaq"
  install -Dm644 * "$pkgdir/usr/lib/peazip/res/bin/lpaq/"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/lpaq/lpaq1"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/lpaq/lpaq5"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/lpaq/lpaq8"
}

package_peazip-additional-formats-plugin-paq() {
  pkgdesc="Additional Formats Plugin for PeaZip (PAQ)"
  license=(GPL-2.0-only)
  depends+=(lib32-glibc lib32-gcc-libs)

  cd "$srcdir/peazip-additional-formats-plugin.$pkgver.LINUX/paq"
  mkdir -p "$pkgdir/usr/lib/peazip/res/bin/paq"
  install -Dm644 * "$pkgdir/usr/lib/peazip/res/bin/paq/"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/paq/paq8f"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/paq/paq8jd"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/paq/paq8l"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/paq/paq8o"
}


package_peazip-additional-formats-plugin-quad() {
  pkgdesc="Additional Formats Plugin for PeaZip (QUAD)"
  license=(LGPL-2.0-only)
  depends+=(lib32-glibc lib32-gcc-libs)

  cd "$srcdir/peazip-additional-formats-plugin.$pkgver.LINUX/quad"
  mkdir -p "$pkgdir/usr/lib/peazip/res/bin/quad"
  install -Dm644 * "$pkgdir/usr/lib/peazip/res/bin/quad/"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/quad/balz"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/quad/bcm"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/quad/quad"
}

package_peazip-additional-formats-plugin-upx() {
  pkgdesc="Additional Formats Plugin for PeaZip (UPX)"
  license=(GPL-2.0-only)
  depends+=()

  cd "$srcdir/peazip-additional-formats-plugin.$pkgver.LINUX/upx"
  mkdir -p "$pkgdir/usr/lib/peazip/res/bin/upx"
  install -Dm644 * "$pkgdir/usr/lib/peazip/res/bin/upx/"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/upx/upx"
}

package_peazip-additional-formats-plugin-zpaq() {
  pkgdesc="Additional Formats Plugin for PeaZip (ZPAQ)"
  license=(GPL-3.0-only)
  depends+=()

  cd "$srcdir/peazip-additional-formats-plugin.$pkgver.LINUX/zpaq"
  mkdir -p "$pkgdir/usr/lib/peazip/res/bin/zpaq"
  install -Dm644 * "$pkgdir/usr/lib/peazip/res/bin/zpaq/"
  chmod 755 "$pkgdir/usr/lib/peazip/res/bin/zpaq/zpaq"
}
