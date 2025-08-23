# Maintainer: Automne von Einzbern <archlinux@automne.me>

_pkgname=vmware-vapi-runtime
pkgname=python-vmware-vapi-runtime
pkgver=2.61.2
pkgrel=2
pkgdesc="VMware vAPI Runtime Client Bindings"
arch=('any')
url="https://pypi.org/project/vmware-vapi-runtime/"
license=('MIT')
depends=('python' 'python-pyopenssl' 'python-setuptools' 'python-requests' 'python-six')
makedepends=('python-pip')
optdepends=('python-lxml: for server functionality'
            'python-werkzeug: for server functionality'
            'python-urllib3: for server functionality'
            'python-twisted: for twisted support'
            'python-service-identity: for twisted support')
source=("https://files.pythonhosted.org/packages/01/cb/ffbb8fbdfd6ceb7a5398d1b5ba2e937bdca189f300435194048038400aec/vmware_vapi_runtime-${pkgver}-py3-none-any.whl")
sha256sums=('35da94fe1a7a4af5d26cf7db534d2929e3a59287749fe093bd8ca8aab35de826')

package() {
    pip install --root="$pkgdir" --ignore-installed --no-deps --no-cache-dir "${srcdir}/vmware_vapi_runtime-${pkgver}-py3-none-any.whl"
}
