# Where to file issues: https://github.com/remotemobprogramming/mob/issues

pkgname=mobsh-bin
pkgver=5.4.4
pkgrel=1
pkgdesc="Fast git handover with mob"
arch=('x86_64' 'aarch64')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=("git")
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
provides=('mobsh')
conflicts=('mobsh' 'mob')

source_x86_64=("$url/releases/download/5.4.4/mob_5.4.4_linux_amd64.tar.gz")
sha256sums_x86_64=(""ee9b89116dbc80d505b6f27844b8da9040bc54f0397c7f5631b8d183b0c460ca"")
source_aarch64=("$url/releases/download/5.4.4/mob_5.4.4_linux_arm64.tar.gz")
sha256sums_aarch64=(""179a5625f2cb19e05f356ac5474c0a83b760ddf2193af55c114ffd1c4f643511"")

package() {
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "mob" "$pkgdir/usr/bin/mob"
}

