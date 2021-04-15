# Maintainer: BootyBlaster <grimm72eaper at pm dot me>
pkgname=myxer-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='A modern Volume Mixer for PulseAudio, built with you in mind.'
url='https://github.com/Aurailus/Myxer'
source=("Myxer::https://github.com/Aurailus/Myxer/releases/latest/download/Myxer")
arch=('x86_64')
license=('GPL3')
depends=('pulseaudio')
optdepends=()
provides=('myxer')
sha256sums=('a8bc3a67e15a8761de94013a35cf83601a6b507065be2d49594e1f9ca383f36a')

package() {
  cd "$srcdir"

  install -Dm755 Myxer "${pkgdir}/usr/bin/myxer"
}

