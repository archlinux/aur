#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.2.0.bfae5cf6
pkgrel=1
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
source=("$pkgname-pkgver.zip::https://gitlab.com/api/v4/projects/42073614/jobs/artifacts/main/raw/surfer_linux.zip?job=linux_build")
sha256sums=('ffd922c6bc223f75a3372f176ef10f1a3a301ea43288ee946d9666fbc2170e8d')

package() {
  install -Dm755 "surfer" "$pkgdir/usr/bin/surfer"
}

