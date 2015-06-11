# Contributor: Ulf WInkelvos <ulf ät winkelvos dot de>
# Former Maintainer: anonymous_user <31337h4ck3r at gmail dot com>
# Former Maintainer: 3V0LU710N <db_eee at hotmail dot com>
# Maintainer: nous at archlinux.us

pkgname=desktop-privileges
pkgver=0.5
pkgrel=1
pkgdesc="A collection of polkit rules to manage automounting of removable media, suspend and hibernate actions and CPU frequency settings."
arch=('any')
url="https://aur.archlinux.org/packages/desktop-privileges/"
license=('GPL')
depends=('polkit-consolekit' 'udisks2-nosystemd' 'upower-pm-utils')
optdepends=('mate-power-manager-upower')
conflicts=('polkit-automount-upower-rules')
replaces=('polkit-automount-upower-rules')
#install=
#changelog=
source=('10-cpufreqselector.rules' '10-udisks.rules' '10-udisks2.rules' '10-upower.rules')

build() {
true
}

package() {
  install -dm755 "${pkgdir}/etc/polkit-1/"
  install -dm700 "${pkgdir}/etc/polkit-1/rules.d/"
  install -Dm644 *.rules ${pkgdir}/etc/polkit-1/rules.d/
}

sha256sums=('681d85042aa06197e00aa54a47d0331f9c8675fdc555321b611a6ec3ab0eb73f'
            '002ec5fd0592bb9a25321ed4836913cdaa818d3322212bd7d0f315509bda7b62'
            'f3f8cb03c13a84cacbc8f1e4517253a009d96335eb648a1253676dac75466766'
            '805cadc921bce8b11f1f6e170428a7d30fc9377f143df1ff4b0efe0e625a96bf')
