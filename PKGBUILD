# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=eks-node-viewer-bin
pkgver=0.4.1 # renovate: datasource=github-releases depName=awslabs/eks-node-viewer
pkgrel=1
pkgdesc="A tool to visualize dynamic node usage within an AWS EKS Kubernetes cluster"
arch=('x86_64')
url="https://github.com/awslabs/eks-node-viewer"
license=('Apache')
depends=('glibc')

source_x86_64=("eks-node-viewer-${pkgver}-x86_64::https://github.com/awslabs/eks-node-viewer/releases/download/v${pkgver}/eks-node-viewer_Linux_x86_64")

sha256sums_x86_64=('1a9483acea1595949fb3d476fc0faae4c2ed5fae771b478a856b6090324c3930')

package() {
    install -Dm755 eks-node-viewer-${pkgver}-${arch} "${pkgdir}/usr/bin/eks-node-viewer"
}
