# Maintainer: Automne von Einzbern <archlinux@automne.me>

_pkgname=vcf-sdk
pkgname=python-vcf-sdk
pkgver=9.0.0.0
pkgrel=1
pkgdesc="VMware VCF SDK - Wrapper package for VMware Cloud Foundation Automation APIs"
arch=('any')
url="https://pypi.org/project/vcf-sdk/"
license=('MIT')
depends=('python' 
         'python-vmware-vcenter'
         'python-pyvmomi'
         'python-vmware-vsan-data-protection'
         'python-vmware-sddc-manager'
         'python-vcf-installer')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/32/b1/40ed374415e55848ed217807887866150c26bc27acfe3900cf2e5853324d/vcf_sdk-${pkgver}-py3-none-any.whl")
sha256sums=('5ec457ecc10d43d589b4eacb0975bcc850d0e4e8b015094cc7bb3a552892f54f')

package() {
    pip install --root="$pkgdir" --ignore-installed --no-deps --no-cache-dir "${srcdir}/vcf_sdk-${pkgver}-py3-none-any.whl"
}
