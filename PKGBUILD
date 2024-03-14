#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.2.0.r471.fb34a4f4
pkgrel=1
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
source=("$pkgname-$pkgver.zip::https://gitlab.com/surfer-project/surfer/-/jobs/6376686969/artifacts/download?file_type=archive")
sha256sums=('a53a9526365737576efc2781be4b212ece399644ce98425e9101808e2573f079')

package() {
  install -Dm755 "surfer" "$pkgdir/usr/bin/surfer"
}

