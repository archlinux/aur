pkgname=mnemo-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Note-taking app designed to enhance the retention of information."
arch=('x86_64')
url="https://github.com/lemueldls/mnemo"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/mnemo/releases/download/mnemo-v$pkgver/Mnemo_${pkgver}_amd64.deb")
sha256sums_x86_64=('c6b529c9bfaf7650738c3815c57ad1e78fe518f5c4089495571a081fd3fb5b77')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
