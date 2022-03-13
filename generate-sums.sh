#!/bin/bash +x

KERNEL="$(uname -s)"
declare -A KERNEL_ARCH=(
  [linux]='x86_64 i686 aarch64 armv5h armv6h armv7h mips64el mipsel mips64 mips ppc64el ppc64 riscv64 s390x'
  [freebsd]='x86_64 i686 aarch64 armv7h'
  [openbsd]='x86_64 i686 aarch64 armv7h'
)
sed -i "s/^\(pkgver=\).*/\\1${VERSION%-*}/" PKGBUILD
echo 'case "${_KERNEL,}" in'
for kern in ${!KERNEL_ARCH[@]}; do
  sed -i "s/^\(arch=\).*/\\1(${KERNEL_ARCH[${kern}]})/" PKGBUILD
  echo "  ${kern}) case \"\${CARCH}\" in"
  for arch in ${KERNEL_ARCH[${kern}]}; do
    _arch="${arch/#armv5*/armv5*}"
    _arch="${_arch/#armv6*/armv6*}"
    _arch="${_arch/#armv7*/armv7*}"
    _arch="${_arch/%*86/i*86}"
    echo "    ${_arch})"
    case "${arch}" in
      x86_64)   _CARCH="64";;
      i*86)     _CARCH="32";;
      aarch64)  _CARCH="arm64-v8a";;
      armv5*)   _CARCH="arm32-v5";;
      armv6*)   _CARCH="arm32-v6";;
      armv7*)   _CARCH="arm32-v7a";;
      ppc64el)  _CARCH="ppc64le";;
      ppc64)    _CARCH="ppc64";;
      s390x)    _CARCH="s390x";;
      mips64el) _CARCH="mips64le";;
      mipsel)   _CARCH="mips32le";;
      mips64)   _CARCH="mips64";;
      mips)     _CARCH="mips32";;
      riscv64)  _CARCH="riscv64";;
    esac
    curl -sSLo "xray-bin-${VERSION}-${kern}-${_CARCH}.tar.gz" "https://github.com/XTLS/Xray-core/releases/download/v${VERSION}/Xray-${kern}-${_CARCH}.zip"
    #CARCH="${arch}" makepkg -Crsfo &>/dev/null ||:  # not sure how to override kernel here
    cat <<EOF
      _CARCH="${_CARCH}"
      sha512sums+=('$(sha512sum xray-bin-${VERSION}-${kern}-${_CARCH}.tar.gz | awk '{print $1}')')
      b2sums+=(    '$(b2sum xray-bin-${VERSION}-${kern}-${_CARCH}.tar.gz | awk '{print $1}')')
      b3sums+=(    '$(b3sum xray-bin-${VERSION}-${kern}-${_CARCH}.tar.gz | awk '{print $1}')')
EOF
    echo '    ;;'
  done; echo '  esac;;'
done; echo 'esac'
sed -i "s/^\(arch=\).*/\\1(${KERNEL_ARCH[${KERNEL,}]})/" PKGBUILD
