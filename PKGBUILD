# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=(
    'python'
    'python-fastapi'
    'uvicorn'
    'python-chromadb-bin'
    'python-onnxruntime-cpu'
    'python-gitpython'
    'python-httpx'
    'python-click'
    'python-rich'
    'python-yaml'
    'python-html2text'
    'python-beautifulsoup4'
    'python-lxml'
    'python-markdownify'
)
makedepends=('python-installer')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
install=python-agent-rtfm.install
_wheel="agent_rtfm-${pkgver}-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/35/cb/c1fd28981bacca65c8971ba09407cdb1eac05df78473fd507b18d5089078/agent_rtfm-0.2.5-py3-none-any.whl")
sha256sums=('SKIP')
noextract=("${_wheel}")

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}/${_wheel}"
}
