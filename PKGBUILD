# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=glassfish5
pkgver=5.0_b18_08_07_2017
_oraver=5.0-b18-08_07_2017
pkgrel=2
pkgdesc="The Open Source Java EE 8 Reference Implementation."
url="https://javaee.github.io/glassfish/"
license=("CDDL")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("http://download.oracle.com/glassfish/5.0/nightly/glassfish-${_oraver}.zip"
		"glassfish5.service")

sha256sums=('790b3395da69934059b3e099993dfd92e4e7381437edec715221109de1c93233'
            '9be6b53df62a719e4cac1b54703f0abcc6c22389d1b46e3e85ed38d6f1453cdc')

package() {
    install -d $pkgdir/opt
    cp -a glassfish5 $pkgdir/opt/glassfish5
    install -D glassfish5.service $pkgdir/usr/lib/systemd/system/glassfish5.service
}
