# Maintainer: PharmaRacist
pkgname=noon-dev
pkgver=2.0.0
pkgrel=1
pkgdesc="Development libraries and build tools for Noon"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'cairomm'
    'clang'
    'cmake'
    'glib2'
    'gobject-introspection'
    'gtkmm3'
    'gtksourceviewmm'
    'gvfs'
    'libdbusmenu-gtk3'
    'libportal-gtk4'
    'libratbag'
    'libsoup3'
    'meson'
    'qt6-5compat'
    'qt6-base'
    'qt6-declarative'
    'qt6-imageformats'
    'qt6-multimedia'
    'qt6-positioning'
    'qt6-quicktimeline'
    'qt6-sensors'
    'qt6-svg'
    'qt6-tools'
    'qt6-translations'
    'qt6-virtualkeyboard'
    'sassc'
    'tinyxml2'
)

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "Development libraries for Noon" > "$pkgdir/usr/share/doc/$pkgname/README"
}
