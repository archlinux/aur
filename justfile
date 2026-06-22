_default:
  @just --list

install-script := 'color-scheme-control.install'
build-dir := 'build'

clean:
  #!/usr/bin/env sh
  if [[ -d './{{ build-dir }}' ]]; then
    rm -rf {{ build-dir }}
  fi

build-prepare: clean
  #!/usr/bin/env sh
  mkdir {{ build-dir }}
  cp PKGBUILD {{ install-script }} {{ build-dir }}

build-install: build-prepare
  #!/usr/bin/env sh
  cd {{ build-dir }}
  makepkg --syncdeps --install

update-srcinfo:
  makepkg --printsrcinfo >.SRCINFO
