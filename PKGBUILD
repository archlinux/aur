pkgname=flix-bin
pkgver=2.0.6.111
pkgrel=1
pkgdesc='像聊天一样传文件，新一代局域网全端传输工具'
arch=('x86_64')
url='https://github.com/Tobiichi-Origuchi/flix-bin'
license=('custom:proprietary')
# makedepends=('libarchive')
# depends=(
#     'at-spi2-core'
    'atk'
    'cairo'
    'fontconfig'
    'gdk-pixbuf'
    'gdk-pixbuf2'
    'gtk'
    'gtk3'
    'harfbuzz'
    'hicolor-icon-theme'
    'kcoreaddons5'
    'ki18n5'
    'libappindicator'
    'libayatana-appindicator'
    'libdbusmenu-glib'
    'libdrm'
    'libepoxy'
    'libkeybinder3'
    'libnotify'
    'libx11'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxrandr'
    'libxtst'
    'mesa'
    'pango'
    'qt5-base'
    'texlive-doc'
# )
# optdepends=(
# 
# )
# provides=(
# 
# )
# conflicts=(
# 
# )
source=(
  "flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst::https://github.com/Tobiichi-Origuchi/flix-bin/releases/download/v2.0.6.111/flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst"
)
sha256sums=(
  '5495e9fe167ec23b4fde517472452984536ee165585b0637ead2c4675b49041c'
)
noextract=(
  'flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst'
)

package() {
  bsdtar --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.INSTALL' -xpf "$srcdir/flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst" -C "$pkgdir"
}
