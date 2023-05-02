# Maintainer: Gerald Wu <gerald at geraldwu dot com>

pkgname=kcp-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Kubernetes-like control plane for workloads on many clusters'
arch=('x86_64')
url='https://github.com/kcp-dev/kcp'
license=('Apache')
source=("kcp-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/kcp_${pkgver}_linux_amd64.tar.gz"
        "kubectl-kcp-plugin-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/kubectl-kcp-plugin_${pkgver}_linux_amd64.tar.gz")
sha256sums=('8744f863232b1ea202598e286cd061fad81b181798fb1e6612b46df5b6423524'
            'adb2a035015af424a3e2ff9a848a2812354de87a532259947dd77fe49eba2dfe')
provides=('kcp' 'kubectl-kcp' 'kubectl-workspace' 'kubectl-workspaces' 'kubectl-ws')

package() {
    install -Dm755 "bin/kcp" "$pkgdir/usr/bin/kcp"
    install -Dm755 "bin/kubectl-kcp" "$pkgdir/usr/bin/kubectl-kcp"
    install -Dm755 "bin/kubectl-workspace" "$pkgdir/usr/bin/kubectl-workspace"
    install -Dm755 "bin/kubectl-workspaces" "$pkgdir/usr/bin/kubectl-workspaces"
    install -Dm755 "bin/kubectl-ws" "$pkgdir/usr/bin/kubectl-ws"
}

