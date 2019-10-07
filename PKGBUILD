# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=go-jira
pkgver=1.0.22
pkgrel=1
pkgdesc="Simple command line client for Atlassian's Jira service written in Go"
url="https://github.com/Netflix-Skunkworks/go-jira"
arch=('x86_64')
license=('APACHE')
source=("jira-$pkgver::https://github.com/Netflix-Skunkworks/go-jira/releases/download/v$pkgver/jira-linux-amd64")
sha256sums=('448e7476b64de85e4958427715f0ea1b5c182461a781fd6ebc75e9f71c70e271')

package() {
  install -Dm755 jira-$pkgver "$pkgdir/usr/bin/jira"
}
