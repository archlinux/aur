pkgname=mnemo-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Note-taking app designed to enhance the retention of information."
arch=('x86_64')
url="https://github.com/lemueldls/mnemo"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/mnemo/releases/download/mnemo-v$pkgver/Mnemo_${pkgver}_amd64.deb")
sha256sums_x86_64=('ce7a23ee03c71830fdd0e79d385ca7e3e4cd12247874b763d7b14d010efe8523')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
