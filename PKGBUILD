pkgname=aeolus-vst3-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Aeolus Organ Synth (VST3)"
url="https://github.com/Archie3d/aeolus_plugin"
license=('GPL')
arch=('x86_64')
groups=('pro-audio' 'vst3-plugins')
depends=('glibc')
provides=("aeolus-vst3")
# do not provide vkd3d and lib32-vkd3d intentionally: providing them may break deepin-wine apps.
options=(!strip)
source=("${url}/releases/download/v${pkgver}/Aeolus-vst3-linux-${pkgver}.zip")
sha256sums=('35a37b9f9bd539b6854fe16eb0d77d76ef6fad6a7dfbc885c5b13d468eed48eb')

package() {
	# Install VST3 Plugin
	install -Dm644 Aeolus.vst3/Contents/x86_64-linux/Aeolus.so $pkgdir/usr/lib/vst3/Aeolus.vst3/Contents/x86_64-linux/Aeolus.so
}
