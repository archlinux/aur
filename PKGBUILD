# Maintainer: omansh-krishn <omanshkrishn@duck.com>

pkgname=crave
pkgver=0.2.7004
_pkgver=0.2-7004
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('aarch64' 'x86_64')
url="https://github.com/accupara/crave"
license=(GPL3)
depends=(gtk3-nocsd glibc libxcrypt-compat openssh rsync zlib )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source_aarch64=( crave::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-aarch64.bin )
source_x86_64=( crave::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums_aarch64=( a243c04f760431b8e9a0e475b167dcf065ca3f63fb8e750abfa5814f7d800884 )
sha256sums_x86_64=( a0bf5584d84c5a420e0c24c0f1c09d52a658829ddb741593b87ebd79dc295dfd )

package() {

	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/crave" "$pkgdir/usr/bin/crave"

}
