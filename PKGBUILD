# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=benthos-bin
_pkgname=${pkgname%-bin}
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=3.53.0
pkgrel=1
arch=(aarch64 armv6h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums=('522850c7435d129342d16c04e1496684b8397f4d703d6c93faf78e4fcc0753f9')
sha256sums_aarch64=('b508406d4ba79e00b043aee908607c0b97b8c394b6982eb4a692d9aefed8cc3f')
sha256sums_armv6h=('1d813f83fecc27cc59990b276e818e4dba7036146aff54d005cca2beb690a54a')
sha512sums=('d2a65c2467a09ae25139c8b2f0af759980c1ce7f44e1e02053afa506662fbcd97e346f3fcb443e8a7b8d6f9d193a29f5da6574e922ffa300ae83faab97d0dd63')
sha512sums_aarch64=('6eb1c79d855cb7dbd3943b0689c70db1c982d3d5d4d0d4d2073e07b47bd218ca935c9bab8425bfee4f7c3ff2f41fda6eb4682902cca067cfa8542da71473bf93')
sha512sums_armv6h=('d3224857cb8ed368db08f7c5d861c703ffea6fd09a6b2955f7436cee2f4315c5fae44e45e8194422ef94eb416b0e669928fee2264dad40ea209bebd2fb842102')
b2sums=('c10024373437679604bc31a3f1ab2bb37b708d67b6be571b6b5c3057b729556b820467a0802ea5b96b24661962430fb2c2b8c5a6976d463cb4fbf88f04729289')
b2sums_aarch64=('7dcf8d110439b8b8be7a6fadbc531e30e60feb7ecad8f2bb9fb3a5f9edf66591f53a93d77101d46b9631651edf529037bb5c30938b69e7119f9798678e4fb698')
b2sums_armv6h=('ba70278c2895b8f32b32300aec410991d0b5a4ea38657c00f0b1166fdfb4ce97c0a9d4b858973703493b712975142d49377d115b3edb1fa7a994fe5fdc4f8102')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
