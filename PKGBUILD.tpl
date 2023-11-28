# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder
pkgdesc="SDK for building Kubernetes APIs"
pkgver=$KUBEBUILDER_VERSION
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
makedepends=(
    'go'
)

_latest() {
    curl -s https://api.github.com/repos/kubernetes-sigs/kubebuilder/releases | jq -r '.[0].tag_name'
}

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/kubebuilder/archive/v${pkgver}.tar.gz"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$pkgname-$pkgver"

    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "\
        -linkmode=external \
        -buildid=''
        -extldflags=\"${LDFLAGS}\" \
        -X main.kubeBuilderVersion=v${pkgver} \
        -X main.goos=$(go env GOOS) \
        -X main.goarch=$(go env GOARCH) \
        -X main.gitCommit= \
        -X main.buildDate=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
      -o bin/kubebuilder ./cmd
}

package() {
    install -D -m0755 "${srcdir}/$pkgname-$pkgver/bin/kubebuilder" "${pkgdir}/usr/bin/kubebuilder"

    "${pkgdir}/usr/bin/kubebuilder" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubebuilder"
    "${pkgdir}/usr/bin/kubebuilder" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubebuilder"
}
