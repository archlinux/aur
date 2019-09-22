# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=go-jira
pkgver=1.0.21
pkgrel=1
pkgdesc="Simple command line client for Atlassian's Jira service written in Go"
url="https://github.com/Netflix-Skunkworks/go-jira"
arch=('x86_64')
license=('APACHE')
source=("jira-$pkgver::https://github.com/Netflix-Skunkworks/go-jira/releases/download/v$pkgver/jira-linux-amd64")
sha256sums=('4de88860dc7bd7e25cd8724ec74495b6727483b0262840e56c59d817b63f398c')

package() {
  install -Dm755 jira-$pkgver "$pkgdir/usr/bin/jira"
}
