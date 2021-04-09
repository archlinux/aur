# Maintainer: BootyBlaster <grimm72eaper at pm dot me>
pkgname=myxer-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A modern Volume Mixer for PulseAudio, built with you in mind.'
url='https://github.com/Aurailus/Myxer'
source=("Myxer::https://github.com/Aurailus/Myxer/releases/latest/download/Myxer")
arch=('x86_64')
license=('GPL3')
depends=('pulseaudio')
optdepends=()
provides=('myxer')
sha256sums=('d12ec6f3924de1ff110dceece78804e1be34d8c87e7ababab5dd34e919a076b7')

package() {
  cd "$srcdir"

  install -Dm755 Myxer "${pkgdir}/usr/bin/myxer"
}

