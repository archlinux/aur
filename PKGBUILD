# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tuhana GAYRETLİ <tuhana at tuta dot io>

_fontname=jura
_pkgname="$_fontname-font"
pkgbase="$_pkgname"
pkgver=5.106
pkgrel=1
pkgdesc="Jura font"
url="https://github.com/ossobuffo/jura"
license=('OFL-1.1-no-RFN')
arch=('any')

_commit=f9df75d92c93324e74e5ec0df6d91c8ee4b84b5a

_pkgsrc="jura-$_commit"
_pkgext="tar.gz"
source=("$_fontname-$pkgver.$_pkgext::$url/archive/$_commit.$_pkgext")
sha256sums=('60ec536e7eadb9d1c86e6bc488c3364a3d63b39134fee15b9b987699ecf77b90')

pkgname=(
  ttf-jura
  otf-jura
  ttf-jura-variable
)

package_ttf-jura() {
  cd "$_pkgsrc"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/ttf/*.ttf
}

package_otf-jura() {
  cd "$_pkgsrc"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/otf/*.otf

}

package_ttf-jura-variable() {
  cd "$_pkgsrc"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/variable/*.ttf
}
