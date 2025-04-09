# Maintainer: skoriop <karthikp.ivy@gmail.com>

pkgname=multipartus-downloader
pkgver=0.0.2
pkgrel=1
pkgdesc="An app that lets you download Impartus video lectures"
arch=(x86_64)
url="https://github.com/crux-bphc/multipartus-downloader"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source=("${url}/releases/download/app-v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('9d14d1a17d9a64ec22387da6e107596e48f74de626b26bb525d9e15fb12240ca')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
