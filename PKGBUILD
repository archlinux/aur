#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.4.0.r1018.1d83e7c2
pkgrel=1
provides=('surfer-waveform')
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
optdepends=('zenity')
source=("$pkgname-$pkgver.zip::https://gitlab.com/api/v4/projects/42073614/jobs/artifacts/main/raw/surfer_linux.zip?job=linux_build")
sha256sums=('SKIP')

makedepends=('python-requests')

pkgver() {
	${startdir}/get_version.py
}

package() {
  install -Dm755 "${srcdir}/surfer" "$pkgdir/usr/bin/surfer"
  install -Dm755 "${srcdir}/surver" "$pkgdir/usr/bin/surver" 
}
