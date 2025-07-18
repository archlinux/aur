# Maintainer: bcoiner <x6ji7ar9 at anonaddy dot me>

pkgname=auto-cpufreq-dinit
pkgver=1
pkgrel=1
pkgdesc="Dinit service files for auto-cpufreq"
arch=('any')
license=('GPL-3.0')
depends=('dinit' 'auto-cpufreq')
source=('auto-cpufreq')
sha256sums=('894aff9fa851c94b3aff02341d46168f1b8db8b16af03f17bcc8d5a1bae2c2a5')

package() {
    install -Dm644 auto-cpufreq "$pkgdir/etc/dinit.d/auto-cpufreq"
}

