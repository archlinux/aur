 ## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=audiolinux
pkgver=1.9
pkgrel=1
pkgdesc="AudioLinux audiophile linux configuration files, scripts and shortcuts"
arch=('x86_64')
url="http://www.audio-linux.com"
license=('custom')
install=$pkgname.install
depends=()
optdepends=('linux-rt: The Linux-rt kernel and modules'
            'nvidia-340xx-rt: NVIDIA 340xx drivers for linux-rt'
            'rtirq: Realtime IRQ thread system tuning' 
            'rtapp: Realtime application thread priority tuning'
            'rt-tests: A collection of latency testing tools for the linux(-rt) kernel'
            'tuna: Application tuning GUI & command line utility'
            'jack2-no-dbus-git: Classic jack2 without dbus enabled. For starting as daemon with systemd'
            'minimserver: UPnP Audio Server'
            'roonserver: The music player for music lovers'
            'roonbridge: The music player for music lovers'
            'mpd: Flexible, powerful, server-side application for playing music'
            'mpd-dsd: Flexible, powerful, server-side application for playing music, with DSD seek support'
            'hqplayer: The high-end upsampling multichannel software HD-audio player' 
            'hqplayer-embedded: Signalyst HQPlayer Embedded HQPlayer - the high-end upsampling multichannel software HD-audio player' 
            'hqplayer-network-audio-daemon: The high-end upsampling multichannel software HD-audio player' 
            'jriver-media-center: The Most Comprehensive Media Software' 
            'dff2dsf: Signalyst DFF to DSF command line conversion utility' 
            'deadbeef: A GTK+ audio player for GNU/Linux'
            'squeezelite-r2-git: Lightweight headless squeezebox emulator'
            'logitechmediaserver-git: Streaming audio server'
            'sox-dsd-git: SoX Resampler library dsd branch')
source=('http://www.tophifi.it/ftp/packages/audiolinux.tar.gz')
sha256sums=('b9442f93c865b842f7b58075e27d577f0f1b1520b813f7e7db40bad2faf93ae1')

package() {
  install -d "$pkgdir/opt/$pkgname"
  bsdtar xf audiolinux.tar.gz -C "$pkgdir/opt/"
  chown -R root:root $pkgdir
}
