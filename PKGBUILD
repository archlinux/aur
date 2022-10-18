# Where to file issues: https://github.com/remotemobprogramming/mob/issues

pkgname=mobsh-bin
pkgver=4.0.0
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

source_x86_64=("$url/releases/download/v4.0.0/mob_v4.0.0_linux_amd64.tar.gz")
sha256sums_x86_64=("3147108e4483214537e6aab8330f5c120fa869ef06eea3c3dd858899349563c9")

package() {
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "mob" "$pkgdir/usr/bin/mob"
}

