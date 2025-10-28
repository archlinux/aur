pkgname=mnemo-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Note-taking app designed to enhance the retention of information."
arch=('x86_64')
url="https://github.com/lemueldls/mnemo"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/mnemo/releases/download/mnemo-v$pkgver/Mnemo_${pkgver}_amd64.deb")
sha256sums_x86_64=('9a27878d0411e452ae0015cb5d0f47f9d095ea1b0d1549e01243b5c6d4bac187')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
