# Maintainer: Lemuel De Los Santos <aur@lemueldls.dev>
pkgname=typbase-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Local-first knowledge base made for Typst and the Atmosphere."
arch=('x86_64')
url="https://github.com/lemueldls/typbase"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/typbase/releases/download/typbase-v$pkgver/Typbase_${pkgver}_amd64.deb")
sha256sums_x86_64=('cec70e1971444fb19cdbd3ac2905f0a3b1ecf296fc2c1ea363a5100ebebf8c8f')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
