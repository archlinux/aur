# Maintainer: Essentral <you@example.com>
pkgname=thinkboxai
pkgver=1.0.0
pkgrel=1
pkgdesc="Thinkbox AI - Desktop App"
arch=('x86_64')
url="https://thinkbox.ai"
license=('unknown')
depends=('glibc')
source=("https://prod-thinkboxai-setups.s3-accelerate.amazonaws.com/${pkgver}/thinkboxai_${pkgver}-1_amd64.deb")
noextract=("thinkboxai_${pkgver}-1_amd64.deb")

package() {
  bsdtar -xf "${srcdir}/thinkboxai_${pkgver}-1_amd64.deb" -C "$srcdir"
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}

sha256sums=('SKIP')
