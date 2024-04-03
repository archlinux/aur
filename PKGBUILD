# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-keyvault-secrets'
_name='azure_keyvault_secrets'
pkgver='4.8.0'
pkgrel=2
pkgdesc="Microsoft Azure Key Vault Secrets Client Library for Python"
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/keyvault/azure-keyvault-secrets"
depends=(
    'python-azure-core>=1.23.0' 'python-azure-core<2.0.0'
    'python-isodate>=0.6.1'
    'python-typing_extensions>=4.10.0'
)

makedepends=('python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/a/azure-keyvault-secrets/azure-keyvault-secrets-${pkgver}.tar.gz")
sha256sums=('5636c0a1d8a20e3c5799cb3ccffd4ebf3f0d1acb7cae9526861833af8b0fe814')

package(){
    cd azure-keyvault-secrets-$pkgver
    python setup.py install --root="$pkgdir"/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
