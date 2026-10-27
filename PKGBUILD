# Maintainer: Lemuel De Los Santos <aur@lemueldls.dev>
pkgname=typbase-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="Local-first knowledge base made for Typst and the Atmosphere."
arch=('x86_64')
url="https://github.com/lemueldls/typbase"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/typbase/releases/download/typbase-v$pkgver/Typbase_${pkgver}_amd64.deb")
sha256sums_x86_64=('99a8f2af1ce5ff58a22fe7d56614a1d7c12fb281d2c208a373438c34833578fa')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
