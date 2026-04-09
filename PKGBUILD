# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=('python>=3.11')
makedepends=('python-installer')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
source=("https://pypi.io/packages/py3/a/agent_rtfm/agent_rtfm-${pkgver}-py3-none-any.whl")
sha256sums=('SKIP')
noextract=("agent_rtfm-${pkgver}-py3-none-any.whl")

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}/agent_rtfm-${pkgver}-py3-none-any.whl"
}
