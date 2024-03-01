#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.2.0.r435.b7118fa4
pkgrel=2
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
source=("$pkgname-pkgver.zip::https://gitlab.com/api/v4/projects/42073614/jobs/artifacts/main/raw/surfer_linux.zip?job=linux_build")
sha256sums=('5993bacef2c0963086c926d92748d6bf4a37be2c6f632c7546a02f6daeb1a421')

package() {
  install -Dm755 "surfer" "$pkgdir/usr/bin/surfer"
}

