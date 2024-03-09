#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.2.0.r459.040ac407
pkgrel=1
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
source=("$pkgname-$pkgver.zip::https://gitlab.com/api/v4/projects/42073614/jobs/artifacts/main/raw/surfer_linux.zip?job=linux_build")
sha256sums=('4ee51a348d6b8d791c16cc75de374ffdf41f5d0a1695cad6a131a55f406f3762')

package() {
  install -Dm755 "surfer" "$pkgdir/usr/bin/surfer"
}

