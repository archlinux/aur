pkgname=mnemo-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Note-taking app designed to enhance the retention of information."
arch=('x86_64')
url="https://github.com/lemueldls/mnemo"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/mnemo/releases/download/mnemo-v$pkgver/mnemo-v${pkgver}-amd64.deb")
sha256sums_x86_64=('d4d13871b5f7bcbc09e53a931e46f79e870fc07096a27a4d94fe4500c6fc95ef')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
