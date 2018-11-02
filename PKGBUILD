# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=go-jira
pkgver=1.0.20
pkgrel=1
pkgdesc="Simple command line client for Atlassian's Jira service written in Go"
url="https://github.com/Netflix-Skunkworks/go-jira"
arch=('x86_64')
license=('APACHE')
source=("jira-$pkgver::https://github.com/Netflix-Skunkworks/go-jira/releases/download/v$pkgver/jira-linux-amd64")
sha256sums=('4eb49f39caa87b2fc799409d2a81118c8da0f11dcd74e51eab959bbcb86e394c')

package() {
  install -Dm755 jira-$pkgver "$pkgdir/usr/bin/jira"
}
