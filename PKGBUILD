# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=eks-node-viewer-bin
pkgver=0.4.3 # renovate: datasource=github-releases depName=awslabs/eks-node-viewer
pkgrel=1
pkgdesc="A tool to visualize dynamic node usage within an AWS EKS Kubernetes cluster"
arch=('x86_64')
url="https://github.com/awslabs/eks-node-viewer"
license=('Apache')
depends=('glibc')

source_x86_64=("eks-node-viewer-${pkgver}-x86_64::https://github.com/awslabs/eks-node-viewer/releases/download/v${pkgver}/eks-node-viewer_Linux_x86_64")

sha256sums_x86_64=('f1aa5ede4a70b254b8a51c2d65fa11a6247e2bbde6c974e110f72d577d1713bf')

package() {
    install -Dm755 eks-node-viewer-${pkgver}-${arch} "${pkgdir}/usr/bin/eks-node-viewer"
}
