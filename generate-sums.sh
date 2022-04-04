#!/bin/sh +x

sed -i "s/^\(pkgver=\).*/\\1${VERSION}/" PKGBUILD
echo 'case "${CARCH}" in'
for i in x86_64 aarch64 armv7h ppc64le s390x; do
  CARCH="${i}" makepkg -Crsfo &>/dev/null ||:
  case "${i}" in
    x86_64)  _CARCH=amd64;;
    aarch64) _CARCH=arm64;;
    arm*)    _CARCH=arm-v7;;
    ppc64le) _CARCH=ppc64le;;
    s390x)   _CARCH=s390x;;
  esac
  i="${i/#armv*/arm*}"
  i="${i/%*86/i*86}"
  cat <<EOF
  ${i})
    _CARCH="${_CARCH}"
    sha512sums=('$(sha512sum "nerdctl-${VERSION}-linux-${_CARCH}.tar.gz" | awk '{print $1}')')
    b2sums=(    '$(b2sum "nerdctl-${VERSION}-linux-${_CARCH}.tar.gz" | awk '{print $1}')')
    b3sums=(    '$(b3sum "nerdctl-${VERSION}-linux-${_CARCH}.tar.gz" | awk '{print $1}')')
  ;;
EOF
done
echo 'esac'
