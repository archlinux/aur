# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=i3status-rust-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='Very resourcefriendly and feature-rich replacement for i3status to use with bar programs (like i3bar and swaybar), written in pure Rust'
url="https://github.com/greshake/i3status-rust"
arch=('x86_64')
license=('GPL3')
depends=('libpulse')
optdepends=('alsa-utils: For the volume block'
            'bluez: For the bluetooth block'
            'curl: For the weather block'
            'ibus: For the ibus block'
            'lm_sensors: For the temperature block'
            'networkmanager: For the networkmanager block'
            'powerline-fonts: For all themes using the powerline arrow char'
            'pulseaudio: For the volume block'
            'speedtest-cli: For the speedtest block'
            'ttf-font-awesome-4: For the awesome icons'
            'upower: For the battery block')
provides=('i3status-rust')
conflicts=('i3status-rust')
source=("https://github.com/greshake/i3status-rust/releases/download/v${pkgver}/i3status-rust_${pkgver}_amd64.deb")
sha256sums=('7c0c5f353419d2cc613eeede1bf36213310009a5135eaaea477c9615f31f4c22')

package() {
  tar -xJf data.tar.xz -C "${pkgdir}"
  # install -Dm755 i3status-rs "$pkgdir/usr/bin/i3status-rs"
}

