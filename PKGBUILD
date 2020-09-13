# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=go-jira
pkgver=1.0.26
pkgrel=1
pkgdesc="Simple command line client for Atlassian's Jira service written in Go"
url="https://github.com/Netflix-Skunkworks/go-jira"
arch=('x86_64')
license=('APACHE')
source=("jira-$pkgver::https://github.com/Netflix-Skunkworks/go-jira/releases/download/v$pkgver/jira-linux-amd64")
sha256sums=('27a1bb92e763ebdb4ba4204a1d7874d3d5e9094f6d6b15299c6e41f6a3546e83')

package() {
  install -Dm755 jira-$pkgver "$pkgdir/usr/bin/jira"
}
