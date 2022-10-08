pkgname=xivastudio-meta-audio-config
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
depends=('realtime-privileges' 'rtirq' 'rtapp' 'a52dec' 'faac' 'faad2' 'flac' 'jasper' 'lame' 'libdca' 'libdv' 'libmad' 'libmpeg2' 'libtheora' 'libvorbis' 'libxv' 'opus' 'wavpack' 'x264' 'xvidcore')
conflicts=('pipewire-biglinux-config-git' 'biglinux-meta-audio-config')
url="https://github.com/xivastudio/xivastudio-meta-audio-config"
pkgdesc="Configura o sistema para audio profissional"
source=("git+https://github.com/xivastudio/xivastudio-meta-audio-config.git")
md5sums=(SKIP)
install=post.install

package() {
    cp -r "${srcdir}/xivastudio-meta-audio-config/etc/" "${pkgdir}/"
    cp -r "${srcdir}/xivastudio-meta-audio-config/usr/" "${pkgdir}/"
}
