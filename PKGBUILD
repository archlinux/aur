pkgname=prev
pkgver=0.1.5
pkgrel=1
pkgdesc="Local-first preview social link cards instantly before deployment"
arch=('x86_64')
url="https://github.com/dhanushk-offl/prev"
license=('MIT')

depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup')

options=('!strip')

source_x86_64=("${url}/releases/download/v${pkgver}/PREVU_${pkgver}_amd64.deb")

sha256sums_x86_64=('a96fcf8a74867f250f3e287f83d4bf37c8e1bc946e635211bc131f7e38b0ac47')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}

