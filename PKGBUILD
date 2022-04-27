# Where to file issues: https://github.com/remotemobprogramming/mob/issues

pkgname=mobsh-bin
pkgver=3.1.1
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

source_x86_64=("$url/releases/download/v3.1.1/mob_v3.1.1_linux_amd64.tar.gz")
sha256sums_x86_64=("44e5886d03156199b2927cc9b677d33da4764155786952e10f8feaaf20534997")

package() {
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "mob" "$pkgdir/usr/bin/mob"
}

