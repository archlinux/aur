pkgname=mnemo-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Note-taking app designed to enhance the retention of information."
arch=('x86_64')
url="https://github.com/lemueldls/mnemo"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lemueldls/mnemo/releases/download/mnemo-v$pkgver/Mnemo_${pkgver}_amd64.deb")
sha256sums_x86_64=('71c2a0ff9483b9d2253bee264b6b1b7b7385382b3e3512221dabf5f287cfa8fd')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
