# Maintainer: Wannes <grimm72eaper@pm.me>
pkgname=myxer-bin
pkgver=1.3.3
pkgrel=1
pkgdesc='A modern Volume Mixer for PulseAudio, built with you in mind.'
url='https://github.com/Aurailus/Myxer'
source=("Myxer::https://github.com/Aurailus/Myxer/releases/latest/download/Myxer")
arch=('x86_64')
license=('GPL3')
depends=('pulseaudio')
optdepends=()
provides=('myxer')
sha256sums=('60bf85aac65b1b1de87c2ed9be84a626a5a069734020fefa3d75540f11aab491')

package() {
  cd "$srcdir"

  install -Dm755 Myxer "${pkgdir}/usr/bin/myxer"
}

