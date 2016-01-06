# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
pkgname=drone-cli
pkgver=0.1
pkgrel=2
pkgdesc="Drone.ci command line utility"
arch=("x86_64")
url="http://readme.drone.io/cli/"
license=('Apache 2.0')
depends=("docker")
source=("http://downloads.drone.io/drone-cli/drone_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/drone/drone-cli/master/LICENSE")
md5sums=('d740355dae3690320d9993db473efc11'
         'd2794c0df5b907fdace235a619d80314')

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/licenses/drone/"
	install -Dm755 drone ${pkgdir}/usr/bin/drone
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/drone/LICENSE
}
