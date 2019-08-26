# Maintainer : Katherine J. Cumberbatch <stykers@stykers.moe>

pkgname=vlc-plugin-fluidsynth
pkgver=3.0.8
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
md5sums=('5a258abe00f25da98ebaba318e4c2221')

package() {
		cd "${srcdir}/"
		install -Dm0755 "${srcdir}/libfluidsynth_plugin.so" "$pkgdir/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so"
}
