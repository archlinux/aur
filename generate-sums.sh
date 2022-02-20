#!/bin/sh +x

sed -i -e "s/^\(pkgver=\).*/\\1${VERSION%-*}/" -e "s/^\(pkgrel=\).*/\\1${VERSION#*-}/" PKGBUILD
echo 'case "${CARCH}" in'
for i in x86_64 i686 aarch64 armv7h mips64el mipsel; do
  _arch="${i/#armv*/arm*}"
  _arch="${_arch/%*86/i*86}"
  echo "  ${_arch})"
  CARCH="${i}" makepkg -Crsfo &>/dev/null ||:
  case "${i}" in
    x86_64)   _CARCH="x64";;
    i*86)     _CARCH="x86";;
    aarch64)  _CARCH="arm64";;
    arm*)     _CARCH="arm";;
    ppc64le)  _CARCH="ppc64le";;
    s390x)    _CARCH="s390x";;
    mips64el) _CARCH="mips64el";;
    mipsel)   _CARCH="mipsel";;
  esac
  cat <<EOF
    _CARCH="${_CARCH}"
    sha512sums=('$(sha512sum naiveproxy-${VERSION}-${_CARCH}.tar.xz | awk '{print $1}')')
    b2sums=(    '$(b2sum naiveproxy-${VERSION}-${_CARCH}.tar.xz | awk '{print $1}')')
    b3sums=(    '$(b3sum naiveproxy-${VERSION}-${_CARCH}.tar.xz | awk '{print $1}')')
EOF
  echo '  ;;'
done
echo 'esac'
