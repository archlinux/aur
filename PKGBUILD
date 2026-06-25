# Maintainer: shinmen <shinmen@example.com>
pkgname=python-google-antigravity
_name=google-antigravity
pkgver=0.1.5
pkgrel=1
pkgdesc="Google's agentic development platform (Python SDK)"
arch=('x86_64')
url="https://github.com/google-antigravity/antigravity-sdk-python"
license=('Apache-2.0')
depends=('python' 'python-absl' 'python-pydantic' 'python-websockets' 'python-protobuf' 'uvicorn' 'python-mcp' 'python-google-genai')
makedepends=('python-installer')
source=("google_antigravity-${pkgver}-py3-none-manylinux_2_17_x86_64.whl::https://files.pythonhosted.org/packages/6e/18/d89abb1dafe906451c2bd13f0c32917e1d35ba95d2436a06907045a69cfd/google_antigravity-0.1.5-py3-none-manylinux_2_17_x86_64.whl")
sha256sums=('ec1ebe4044b92e41f6f1632cfac98bb29f03ef0be52446cb5a67576147148363')

package() {
    python -m installer --destdir="$pkgdir" "google_antigravity-${pkgver}-py3-none-manylinux_2_17_x86_64.whl"
}
