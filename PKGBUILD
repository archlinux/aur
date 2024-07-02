pkgname=mobsh-bin
pkgver=5.0.0
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
source_x86_64=("https://github.com/remotemobprogramming/mob/releases/download/v5.0.0/mob_v5.0.0_linux_amd64.tar.gz")
sha256sums_x86_64=("9856fd45208bd83264cb015d8403e841d85327356f50bc3773a4a735abd2bf5c")
package() {
install -D -m644 "LICENSE" "\$pkgdir/usr/share/licenses/\$pkgname/LICENSE"
    install -D -m755 mob_linux_amd64 "\$pkgdir/usr/bin/mob"
}
