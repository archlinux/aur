# Maintainer: BootyBlaster <grimm72eaper at pm dot me>
pkgname=myxer-bin
pkgver=1.2.1
pkgrel=2
pkgdesc='A modern Volume Mixer for PulseAudio, built with you in mind.'
url='https://github.com/Aurailus/Myxer'
source=("Myxer::https://github.com/Aurailus/Myxer/releases/download/${pkgver}/Myxer"
        "https://raw.githubusercontent.com/VixenUtils/Myxer/${pkgver}/Myxer.desktop")
arch=('x86_64')
license=('GPL3')
depends=('pulseaudio')
optdepends=()
provides=('myxer')
sha256sums=('a8bc3a67e15a8761de94013a35cf83601a6b507065be2d49594e1f9ca383f36a'
            'bad653aab271ac23ec98dc1c58a01e98a825f5a131ae579524a514d3d7e880e5')

package() {
  cd "$srcdir"

  install -Dm755 Myxer "${pkgdir}/usr/bin/myxer"
  install -Dm644 "${srcdir}/Myxer.desktop" "${pkgdir}/usr/share/applications/myxer.desktop"
}

