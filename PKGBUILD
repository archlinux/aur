# Maintainer: AegisCanary

pkgname=sbmusic-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="A free alternative to Spotify"
arch=('x86_64')
url="https://sb-music.com"
license=('custom')

depends=(
    'at-spi2-core'
    'cairo'
    'curl'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'harfbuzz'
    'hicolor-icon-theme'
    'jansson'
    'gcc-libs'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
    'zlib-ng-compat'
)

provides=('sbmusic')
conflicts=('sbmusic')

source=("https://github.com/aegiscanary/sbmusic-bin/releases/download/v${pkgver}/sb-music-desktop-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('bbb4b4ad479feab58cde56e91f62332c7746b73602d5e0a46ca2f89e0458adce')

package() {
    cp -rp "$srcdir"/* "$pkgdir/"
    rm -f "$pkgdir"/.PKGINFO "$pkgdir"/.BUILDINFO "$pkgdir"/.MTREE
}
