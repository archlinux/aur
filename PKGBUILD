# Maintainer: shinmen <shinmen@example.com>
pkgname=python-google-antigravity
_name=google-antigravity
pkgver=0.1.7
pkgrel=1
pkgdesc="Google's agentic development platform (Python SDK)"
arch=('x86_64')
url="https://github.com/google-antigravity/antigravity-sdk-python"
license=('Apache-2.0')
depends=('python' 'python-absl' 'python-pydantic' 'python-websockets' 'python-protobuf' 'uvicorn' 'python-mcp' 'python-google-genai')
makedepends=('python-installer')
source=("google_antigravity-${pkgver}-py3-none-manylinux_2_17_x86_64.whl::https://files.pythonhosted.org/packages/41/55/c5e11b0f91c70540a0e247c53de117c0986b167e94e205c131dc8fadcf76/google_antigravity-${pkgver}-py3-none-manylinux_2_17_x86_64.whl")
sha256sums=('0958f4481dd4700a0a32acb948f959fb1858657038f103c5a0d067727010f71e')

package() {
    python -m installer --destdir="$pkgdir" "google_antigravity-${pkgver}-py3-none-manylinux_2_17_x86_64.whl"
}
