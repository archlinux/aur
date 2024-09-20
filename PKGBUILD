pkgname=mobsh-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Fast git handover with mob"
arch=('x86_64')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=("git")
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
provides=('mobsh')
conflicts=('mobsh' 'mob')
source_x86_64=("https://github.com/remotemobprogramming/mob/releases/download/v5.2.0/mob_v5.2.0_linux_amd64.tar.gz")
sha256sums_x86_64=("46dada071cf947bb8dab0bfd7ec3e1acc08b1c73c8e096f95cf148a8cb81d718")
package() {
install -D -m644 "LICENSE" "\$pkgdir/usr/share/licenses/\$pkgname/LICENSE"
    install -D -m755 mob_linux_amd64 "\$pkgdir/usr/bin/mob"
}
