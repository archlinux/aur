# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=iceape-bin
pkgver=2.40
pkgrel=1
pkgdesc="A libre version of Debian Iceape, the internet suite based on SeaMonkey."
arch=('i686' 'x86_64')
url="https://wiki.parabola.nu/$pkgname"
license=('BSD')
provides=('iceweasel')
depends=(alsa-lib dbus-glib desktop-file-utils gtk2 hunspell libevent libnotify mozilla-searchplugins libvpx=1.6.0 libxt mime-types mozilla-common  nss sqlite startup-notification libpulse icu=58.2 gconf)
optdepends=('gst-plugins-base: vorbis decoding, ogg demuxing'
            'gst-plugins-bad: aac, vp8 and opus decoding'
            'gst-plugins-good: webm and mp4 demuxing'
            'gst-plugins-ugly: h.264 decoding')
options=('!strip')
source_i686=(https://repomirror.parabola.nu/pool/parabola_gnu+linux/iceape-1:$pkgver-5-i686.pkg.tar.xz
        )
source_x86_64=(https://repomirror.parabola.nu/pool/parabola_gnu+linux/iceape-1:$pkgver-5-x86_64.pkg.tar.xz)


sha256sums_i686=('e5f6c473a17e0ed2df8f4440c600beaf96646fa46e1dac58cf28e19a75a733b5')
sha256sums_x86_64=('9b5c7aecb93b31ec37f1c30aaf90ff0291a983aa0cbb38f0f2255ccf02c2df81')

package() {
  tar xJvf ${srcdir}/iceape-1:$pkgver.deb1-1-$arch.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:


