# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm
pkgver=0.1.1
pkgrel=2
pkgdesc="Local documentation retrieval service for agent-assisted development"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=('python>=3.11' 'python-pip')
optdepends=('uv: faster install and runtime')
source=("https://pypi.io/packages/source/a/agent-rtfm/agent_rtfm-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "agent_rtfm-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install \
        --root="${pkgdir}" \
        --no-warn-script-location \
        --disable-pip-version-check \
        .
}
