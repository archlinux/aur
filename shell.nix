{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    (pacman.overrideDerivation (old: {
      postFixup = old.postFixup + ''
        sed -i 's|/usr/bin/|${pkgs.coreutils}/bin/env |g' $out/etc/makepkg.conf
      '';
    }))
    curl
    fakeroot
    file
    libarchive # bsdtar
  ];
}
