# Maintainer: Automne von Einzbern <archlinux@automne.me>

_pkgname=vmware-vapi-common-client
pkgname=python-vmware-vapi-common-client
pkgver=2.61.2
pkgrel=2
pkgdesc="VMware vAPI Common Services Client Bindings"
arch=('any')
url="https://pypi.org/project/vmware-vapi-common-client/"
license=('MIT')
depends=('python' 'python-vmware-vapi-runtime')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/0c/79/3e0c6972f965e1cbca52a4ba2db7791bcd5c7320203bd0b1551d3dfa89fe/vmware_vapi_common_client-${pkgver}-py3-none-any.whl")
sha256sums=('1e144695c2dd1657d62322d1024148e8612eaa81eb93a1c1207496426dff1935')

package() {
    pip install --root="$pkgdir" --ignore-installed --no-deps --no-cache-dir "${srcdir}/vmware_vapi_common_client-${pkgver}-py3-none-any.whl"
}
