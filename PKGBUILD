# Where to file issues: https://github.com/remotemobprogramming/mob/issues

pkgname=mobsh-bin
pkgver=2.4.0
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

source_x86_64=("$url/releases/download/v2.4.0/mob_v2.4.0_linux_amd64.tar.gz")
sha256sums_x86_64=("3e72aaf2fc5e04ad3fc0b26132096a8ec468ed78aab67fb0e406736ea6e694eb")

package() {
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "mob" "$pkgdir/usr/bin/mob"
}

