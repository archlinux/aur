# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>
pkgname=podman-compose
pkgver=0.1.5
pkgrel=2
pkgdesc='a script to run docker-compose.yml using podman'
arch=('any')
url='https://github.com/containers/podman-compose'
license=('GPLv2')
depends=('podman' 'python' 'python-yaml')
source=("https://github.com/containers/podman-compose/archive/v${pkgver}.zip")
sha256sums=('a21f767c2970041f2b22ae57915ae3a5bd23089a438ec37c67b3a2ba122da3c8')

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
