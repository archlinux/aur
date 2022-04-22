# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154,SC2128

pkgname=(ttf-jura otf-jura ttf-jura-variable)
pkgbase=jura-font
pkgver=r108.f9df75d
pkgrel=1
pkgdesc="Jura font"
arch=(any)
url=https://github.com/ossobuffo/jura
license=(OFL)
depends=(fontconfig xorg-mkfontscale)
_last_commit_hash=f9df75d92c93324e74e5ec0df6d91c8ee4b84b5a
source=("$url/archive/${_last_commit_hash}.zip")
sha256sums=(7f92a1d27f824a0ac370075b1fdbfdd74291175cedf084715d76acc3fae7ee78)

package_ttf-jura() {
  pkgdesc+=" - TTF variation"

  cd "$srcdir/jura-${_last_commit_hash}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/ttf/*.ttf
}

package_otf-jura() {
  pkgdesc+=" - OTF variation"

  cd "$srcdir/jura-${_last_commit_hash}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/otf/*.otf

}

package_ttf-jura-variable() {
  pkgdesc+=" - variable variation"

  cd "$srcdir/jura-${_last_commit_hash}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/variable/*.ttf
}
