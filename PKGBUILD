# Maintainer: Nia Schlegel <nia@3nt3.de>

pkgname=ttf-osifont
pkgver=1.0.1
pkgrel=1
pkgdesc='Free TrueType font for CAD projects'
arch=('any')
url='https://github.com/hikikomori82/osifont'
license=('GPL-3.0-with-font-exception')
_commit='2e9aa86a8a09b044e08c00f5a4a2505dc3ca9f6e'
source=(
  "$pkgname-osifont-$_commit.ttf::$url/raw/$_commit/osifont.ttf"
  "$pkgname-osifont-italic-$_commit.ttf::$url/raw/$_commit/osifont-italic.ttf"
  "$pkgname-README-$_commit.md::$url/raw/$_commit/README.md"
)
sha256sums=('31e457a464b27ad0e3137bf957f0f4044ed9a3678df91eea2aea55c97c677208'
            'b42f97241fd3b84c2c1a74e5c9efd1582c6a2bac8d6198dad8b2d862cdf72f67'
            '7ba462231fd835682f2594db1207ef2eed8dc4b0f25a160dfe8350313de526c2')

package() {
  install -Dm644 "$pkgname-osifont-$_commit.ttf" "$pkgdir/usr/share/fonts/TTF/osifont.ttf"
  install -Dm644 "$pkgname-osifont-italic-$_commit.ttf" "$pkgdir/usr/share/fonts/TTF/osifont-italic.ttf"
  install -Dm644 "$pkgname-README-$_commit.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
