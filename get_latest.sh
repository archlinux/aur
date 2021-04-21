export "$(grep 'pkgver=' PKGBUILD)"

for arch in amd64 arm arm64 ; do
    wget -O linkerd-$arch https://github.com/linkerd/linkerd2/releases/download/stable-${pkgver}/linkerd2-cli-stable-${pkgver}-linux-$arch
done

sha256sum linkerd-a*
rm linkerd-a*
