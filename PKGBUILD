# Contributor: Francesco 'Kiko' Corsentino <kikocorsentino@gmail.com>
# Contributor: Nathan O <ndowens04 at gmail dot com>
# Contributor: bidulock (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=cputnik
pkgver=0.2.0
pkgrel=8
pkgdesc="Dockapp showing a simple CPU and memory monitor."
#url="http://dockapps.windowmaker.org/file.php/id/273"
url="http://web.archive.org/web/20121031043853/http://dockapps.windowmaker.org/file.php/id/273"
license="GPL"
depends=('libxpm')
optdepends=('xorg-xkill: for right click - killing apps by window'
            'gnome-system-monitor: for left click - start system monitor')
arch=('i686' 'x86_64')
#source=("http://dockapps.windowmaker.org/download.php/id/576/cputnik-$pkgver.tar.gz")
source=("cputnik-0.2.0.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
 }

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 cputnik "$pkgdir/usr/bin/cputnik"
}

md5sums=('54df4b3b22a06ac8e0913ee54d121c18')
