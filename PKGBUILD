#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.2.0.r436.34183514
pkgrel=2
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
source=("$pkgname-$pkgver.zip::https://gitlab.com/api/v4/projects/42073614/jobs/artifacts/main/raw/surfer_linux.zip?job=linux_build")
sha256sums=('147741f72f15fffe0995c46b18d177774bd0dfde7dfe0e42a8966ce30e8fc876')

package() {
  install -Dm755 "surfer" "$pkgdir/usr/bin/surfer"
}

