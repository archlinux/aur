# Maintainer: Twann <twann@ctemplar.com>

pkgname=gitlab-runner-openrc
pkgver=20211003
pkgrel=1
pkgdesc="OpenRC gitlab-runner init script"
arch=('any')
url="https://codeberg.org/twann/openrc-pkgbuilds"
license=('GPL3')
depends=('gitlab-runner' 'openrc')
source=("gitlab-runner")
sha512sums=('cfcab44e538548bbda9c71aeabf612400345380f0636033ea349903f92b8be087d58882cc07564fcba46c782eea3eb22235476de103ddd2f41dbc151f2384954')

package() {
    install -Dm755 gitlab-runner "$pkgdir/etc/init.d/gitlab-runner"
}
