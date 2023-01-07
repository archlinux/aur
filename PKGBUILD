# Maintainer: Jan “Khardix” Staněk <khardix [at] gmail [dot] com>

pkgname=greetd-artix-openrc
pkgver=0.9.0
pkgrel=1
pkgdesc="OpenRC init scripts for greetd"
arch=('any')
license=(GPL3)
source=("greetd.initd"
        "greetd.confd")
sha256sums=('a599f719a445eee3b9f3f38962e9ae706b3ef0986affbca95f025dd98095bbd8'
            'aeed4de39fdb471e0ad8a7f1471232e97925447213292fe4c57317aab6cf035a')

requires=('greetd' 'openrc')

backup=(
    'etc/init.d/greetd'
    'etc/conf.d/greetd'
)

package() {
    install -m0755 -D   greetd.initd            "${pkgdir}/etc/init.d/greetd"
    install -m0644 -D   greetd.confd            "${pkgdir}/etc/conf.d/greetd"
}
