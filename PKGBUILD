#Program author: https://vk.com/mikhailnov
#Maintainer: you-oopsdev <itachi522ru@gmail.com>
_srcname=pulsejoin$pkgver

pkgname=pulsejoin
pkgver=2.4
pkgrel=1
pkgdesc='GUI for making a virtual PulseAudio microphone, from which sound from both microphone and audio output can be recorded'
arch=('any')
url='https://gitlab.com/mikhailnov/pulsejoin'
license=('GPL3')
depends=('pulseaudio' 'pavucontrol-qt' 'yad' 'pavucontrol')
makedepends=('git')
source=("$_srcname::git+https://gitlab.com/mikhailnov/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
        cd "$srcdir"/$_srcname/
        make DESTDIR="${pkgdir}/" install
}
