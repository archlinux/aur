pkgname=stickies-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Local sticky notes for Linux Wayland with Layer Shell v4+'
arch=('x86_64')
url='https://github.com/0atxl/stickies'
# Application, embedded fonts and the included Rust dependency notices.
license=('MPL-2.0' 'OFL-1.1' 'MIT' 'Apache-2.0' 'Unicode-3.0'
         'Apache-2.0 WITH LLVM-exception')
depends=('cairo' 'dbus' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'graphene'
         'gtk4>=1:4.10' 'gtk4-layer-shell>=1.0' 'libadwaita>=1:1.7'
         'libgcc' 'pango>=1.56' 'sqlite' 'librsvg')
options=('!debug' '!strip')
source=("https://github.com/0atxl/stickies/releases/download/v0.10/stickies-0.10.0-1-x86_64.pkg.tar.zst")
sha256sums=('1d76759b0ab04fdfaea200ec342bbd6760c2e2608ced048c331b5c0576226635')

provides=("stickies=$pkgver")
conflicts=('stickies')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
