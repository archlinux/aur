# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=go-jira-bin
conflicts=('go-jira')
pkgver=1.0.27
pkgrel=1
pkgdesc="Simple command line client for Atlassian's Jira service written in Go"
url="https://github.com/Netflix-Skunkworks/go-jira"
arch=('x86_64')
license=('APACHE')
source=("jira-$pkgver::https://github.com/Netflix-Skunkworks/go-jira/releases/download/v$pkgver/jira-linux-amd64")
sha256sums=('c02854a29c28961e40f422dafbaa7400cefdaf3fcc5b6e662a69e4f8297ab529')

package() {
  install -Dm755 jira-$pkgver "$pkgdir/usr/bin/jira"
}
