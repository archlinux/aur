update version:
  sed --regexp-extended --in-place -E "0,/pkgver=.+$/{s/(pkgver=)(.+$)/\1{{version}}/}" ./PKGBUILD
  sed --regexp-extended --in-place -E "0,/sha512sums=.+$/{s/sha512sums=.+$/$(makepkg --geninteg)/}" ./PKGBUILD
  makepkg --printsrcinfo > .SRCINFO
  git commit --all --message $(echo {{version}} | tr -d '"'})