# Maintainer: Konstantin Gribov <grossws@gmail.com>

pkgname=cfssl
_pkgver=1.2
pkgver=${_pkgver}.0
pkgrel=1
pkgdesc="CloudFlare PKI and TLS toolkit"
arch=('i686' 'x86_64')
url="https://cfssl.org/"
license=('BSD')
depends=('glibc')

source_x86_64=("cfssl::https://pkg.cfssl.org/R${_pkgver}/cfssl_linux-amd64"
               "cfssljson::https://pkg.cfssl.org/R${_pkgver}/cfssljson_linux-amd64"
               "cfssl_mkbundle::https://pkg.cfssl.org/R${_pkgver}/mkbundle_linux-amd64"
               "cfssl_multirootca::https://pkg.cfssl.org/R${_pkgver}/multirootca_linux-amd64"
               "cfssl-bundle::https://pkg.cfssl.org/R${_pkgver}/cfssl-bundle_linux-amd64"
               "cfssl-certinfo::https://pkg.cfssl.org/R${_pkgver}/cfssl-certinfo_linux-amd64"
               "cfssl-newkey::https://pkg.cfssl.org/R${_pkgver}/cfssl-newkey_linux-amd64"
               "cfssl-scan::https://pkg.cfssl.org/R${_pkgver}/cfssl-scan_linux-amd64")
source_i686=("cfssl::https://pkg.cfssl.org/R${_pkgver}/cfssl_linux-386"
             "cfssljson::https://pkg.cfssl.org/R${_pkgver}/cfssljson_linux-386"
             "cfssl_mkbundle::https://pkg.cfssl.org/R${_pkgver}/mkbundle_linux-386"
             "cfssl_multirootca::https://pkg.cfssl.org/R${_pkgver}/multirootca_linux-386"
             "cfssl-bundle::https://pkg.cfssl.org/R${_pkgver}/cfssl-bundle_linux-386"
             "cfssl-certinfo::https://pkg.cfssl.org/R${_pkgver}/cfssl-certinfo_linux-386"
             "cfssl-newkey::https://pkg.cfssl.org/R${_pkgver}/cfssl-newkey_linux-386"
             "cfssl-scan::https://pkg.cfssl.org/R${_pkgver}/cfssl-scan_linux-386")
source=("LICENSE::https://raw.githubusercontent.com/cloudflare/${pkgname}/${pkgver}/LICENSE")
sha256sums_x86_64=('eb34ab2179e0b67c29fd55f52422a94fe751527b06a403a79325fed7cf0145bd'
                   '1c9e628c3b86c3f2f8af56415d474c9ed4c8f9246630bd21c3418dbe5bf6401e'
                   '88f90fa9120662c3acdbbedd22306f4cf7ae71e9708838a6d5c8f1652b5bf747'
                   '7b7884ae113eb7693591194399d424bd39902252c3198d6dea075ac98b3f275d'
                   'c0ad5348ede0b8038872bf06bab1f81657b710392371c5db10bd8372336ebd0f'
                   'ad395c35824bdff343189188658f15810d137c230463810026c6f04f3f78f08f'
                   'eb58dfa8c8115b59f28d8444b1007c7be169814d24b8702d34dace3b208b3b20'
                   '1eb88a7898ac9006584fc689ff8c29f1ad9837d9fbf794fa7c62976fd8b490a3')
sha256sums_i686=('b968f3c2aedff9557f80102293f34fea262c7d7b53bec057b3f138ca456c6ed5'
                 '5ad9be85ea5e4371fcfedb5abbf31302de0860ed4b53adc6251227c6792a1a9a'
                 '86f2a93bf32eace855036835466400c8cc1934bf26a27f38d7a4c0a0062c1c99'
                 'a1cf390ac42006fe659e25587c7ba74ea63c7d27a557d733efecdd7e4fd7f25f'
                 '0eb68020b0be3b540450543b7d7484fb3a68f036cc3525060e1f41dc2378af49'
                 'b9336fabec0413e9dd5a95ab43583bfe328eaee238ceb445cbafb27947d4fcd4'
                 '2475fc8761546e6bb61fa4f6be32828c7778f0d9faf137db475aebb25da2a91a'
                 '07142231c17645275b3b5461ce1b61f6a8cbc0c245767796123950f2c0d2b924')
sha256sums=('dc439285c60b63ec585769cf151a03345654a78271cdfd56250f59f1175fba88')

package() {
  install -m755 -D -t "${pkgdir}/usr/bin/" cfssl cfssljson cfssl_mkbundle cfssl_multirootca cfssl-bundle cfssl-certinfo cfssl-newkey cfssl-scan
  install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: et: sw=2: sts=2:
