# Maintainer: Amrit Ghimire <iamritghimire@gmail.com>
pkgname=jira-terminal-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
url="https://github.com/amritghimire/jira-terminal"
license=("AGPL-3.0-only")
arch=("x86_64")
provides=("jira-terminal")
source=("https://github.com/amritghimire/jira-terminal/releases/download/v$pkgver/jira-terminal-v$pkgver-linux.tar.gz")
sha256sums=("e87089b46690e805fb5a0486d688a1f6bc8f66d8b6fa3907200528f3405b7e98")

package() {
    install -Dm755 jira-terminal -t "$pkgdir/usr/bin/"
}
