# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato
pkgname=kubedb-cli-bin
pkgver=0.37.0
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
arch=('x86_64' aarch64)
url="https://kubedb.com/"
license=('Apache')
provides=('kubedb-cli')
source_x86_64=(https://github.com/kubedb/cli/releases/download/v$pkgver/kubectl-dba-linux-amd64.tar.gz)
source_aarch64=(https://github.com/kubedb/cli/releases/download/v$pkgver/kubectl-dba-linux-arm64.tar.gz)
# source=("https://github.com/kubedb/cli/releases/download/$pkgver/kubedb-linux-amd64")
sha512sums_x86_64=('67e1daab8201fb4c6772676f4d5191e36b9e630e498dc5c299fe8a6d7b3253f3e38392964c0084450ca72596324eb2cdc5eec47f36a432f8c1626ae08faf0ea5')
sha512sums_aarch64=('fd8f2e5fe1c7788056739ee56225dc501393f36c198729c9c8890c78a29df10eb33f8c10fdc79f93b8e8adb44476b51fce7ef85994c57981c79751ce34b14309')

package() {
	rm -v *.tar.gz
	install -vDm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
	install -vDm755 ku* $pkgdir/usr/bin/kubedb
}

# vim:set ts=2 sw=2 et:
