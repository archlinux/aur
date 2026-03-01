# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Maintainer: Nguyen Quang Minh <minhnbnt at gmail dot com>

# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)

pkgname=templ-bin
pkgver=0.3.1001 # datasource=github-releases depName=a-h/templ
pkgrel=1
pkgdesc="A language for writing HTML user interfaces in Go."
arch=('aarch64' 'i386' 'x86_64')
url='https://github.com/a-h/templ'
license=('MIT')
provides=('templ')
conflicts=('templ')

source_aarch64=("templ-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/templ_Linux_arm64.tar.gz")
source_i386=("templ-i386-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/templ_Linux_i386.tar.gz")
source_x86_64=("templ-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/templ_Linux_x86_64.tar.gz")

sha256sums_aarch64=('236de54408f96edfae30c9d1dc1924b7baa15b22767c24b864670be1e67db699')
sha256sums_i386=('40636f6a84f493d87ddcd2be805957d0e016d80649d38184a670a6069e9f4301')
sha256sums_x86_64=('30ad2671c8b0a475bd2fbb9f521909869fe4c2693d2f4d90682b12c83de9fe1c')

package() {
	install -Dm755 'templ' "${pkgdir}/usr/bin/templ"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
