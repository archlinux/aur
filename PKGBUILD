# Maintainer: Automne von Einzbern <archlinux@automne.me>

_pkgname=vcf-installer
pkgname=python-vcf-installer
pkgver=9.0.0.0
pkgrel=1
pkgdesc="VMware VCF Installer Python API Bindings"
arch=('any')
url="https://pypi.org/project/vcf-installer/"
license=('MIT')
depends=('python' 'python-vmware-vapi-common-client' 'python-vmware-vapi-runtime')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/f9/28/6fa5f6e8c1963b7c561cdb125e25d8863123a906093ee6712a56284e299a/vcf_installer-${pkgver}-py3-none-any.whl")
sha256sums=('ec7a335562340fd08d19aca9d017ccb0d79d389af171eccc9da2db22960bb00f')

package() {
    pip install --root="$pkgdir" --ignore-installed --no-deps --no-cache-dir "${srcdir}/vcf_installer-${pkgver}-py3-none-any.whl"
}
