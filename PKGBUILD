# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=go-jira
pkgver=1.0.23
pkgrel=1
pkgdesc="Simple command line client for Atlassian's Jira service written in Go"
url="https://github.com/Netflix-Skunkworks/go-jira"
arch=('x86_64')
license=('APACHE')
source=("jira-$pkgver::https://github.com/Netflix-Skunkworks/go-jira/releases/download/v$pkgver/jira-linux-amd64")
sha256sums=('e2550f69ed5471bf4699554ff72b4bb41445266ae3a2c02a4594cd0557dd1f2a')

package() {
  install -Dm755 jira-$pkgver "$pkgdir/usr/bin/jira"
}
