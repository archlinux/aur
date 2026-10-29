# Maintainer: Lemuel De Los Santos <aur@lemueldls.dev>
pkgname=typbase-bin
pkgver=0.4.8
pkgrel=1
pkgdesc="Local-first knowledge base made for Typst and the Atmosphere."
arch=('x86_64')
url="https://github.com/lemueldls/typbase"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/typbase/releases/download/typbase-v$pkgver/Typbase_${pkgver}_amd64.deb")
sha256sums_x86_64=('7f704210cff9d7b390b6aa43118aa6027cb8add2f8ced28695b6d1e06f373a25')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
