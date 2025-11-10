pkgname=mnemo-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Note-taking app designed to enhance the retention of information."
arch=('x86_64')
url="https://github.com/lemueldls/mnemo"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/mnemo/releases/download/mnemo-v$pkgver/Mnemo_${pkgver}_amd64.deb")
sha256sums_x86_64=('0f1825f1ba7c5fb62bf6bfdf47dd2ae3f67ddc08e21ca8c8c4f5ed80b6bc8ee2')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
