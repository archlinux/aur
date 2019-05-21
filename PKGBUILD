# Maintainer : Katherine Cumberbatch <stykers@stykers.moe>
# Plugin file is obtained from Debian package vlc-plugin-fluidsynth_3.0.1-1_amd64.deb

pkgname=vlc-plugin-fluidsynth
pkgver=3.0.1
pkgrel=1
pkgdesc="FluidSynth plugin for VLC"
arch=('x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1')
depends=('vlc>3.0.0' 'fluidsynth')
optdepends=("soundfont-fluid: FluidR3_GM soundfont")
conflicts=("${pkgname}-git")
replaces=("${pkgname}-git")
install="notes.install"
source=("libfluidsynth_plugin.so")
md5sums=('6cd7738f25d45977f0fded19d8d800c9')

package() {
		cd "${srcdir}/"
		install -Dm0755 "${srcdir}/libfluidsynth_plugin.so" "$pkgdir/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so"
}
