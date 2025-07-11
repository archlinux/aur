# Maintainer: Camille <ton-email@exemple.com>
pkgname=aeryth
pkgver=1.0.0
pkgrel=1
pkgdesc="Great tool to convert AppImage into Debian or ArchLinux packages (FR/EN/ES/IT/DE) developed by PEPINATURE the ecological & nourishing fruit nursery"
arch=('any')
url="https://gitlab.com/pepinature/aeryth"
license=('GPL3')
depends=('bash')
source=("git+$url.git"
        "aeryth.desktop"
        "aeryth.png")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 aeryth.sh "$pkgdir/usr/bin/aeryth"
  install -Dm644 "$srcdir/aeryth.desktop" "$pkgdir/usr/share/applications/aeryth.desktop"
  install -Dm644 "$srcdir/aeryth.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/aeryth.png"
}

