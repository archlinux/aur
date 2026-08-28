{
  description = "Hermetic build environment for the trackaudio-bin AUR recipe";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs:
        let
          # Arch's stock makepkg.conf points its download agents at
          # /usr/bin/curl, which does not exist on NixOS. makepkg validates the
          # agent with `[[ -x $program ]]` (an absolute-path test, not a PATH
          # lookup), so rewrite the curl agents to this shell's curl. Only the
          # protocol actually used (https) is validated, so the unused
          # rsync/scp agents are left untouched.
          makepkgConf = pkgs.runCommand "makepkg.conf" { } ''
            sed 's,/usr/bin/curl,${pkgs.curl}/bin/curl,g' \
              ${pkgs.pacman}/etc/makepkg.conf > $out
          '';

          # makepkg's sysconfdir is /etc (absent here), so always feed it our
          # patched config. Wrapping keeps `makepkg` a drop-in command.
          makepkg = pkgs.writeShellScriptBin "makepkg" ''
            exec ${pkgs.pacman}/bin/makepkg --config ${makepkgConf} "$@"
          '';

          # makepkg shells out to `pacman -Q` while writing .BUILDINFO. pacman's
          # sysconfdir and DBPath default to /etc and /var/lib/pacman, both
          # absent here, so hand it the shipped pacman.conf plus an empty alpm
          # db. The installed-package list is meaningless on NixOS anyway; this
          # just keeps packaging output error-free.
          emptyDb = pkgs.runCommand "pacman-empty-db" { }
            "mkdir -p $out/local $out/sync && echo 9 > $out/local/ALPM_DB_VERSION";
          pacman = pkgs.writeShellScriptBin "pacman" ''
            exec ${pkgs.pacman}/bin/pacman \
              --config ${pkgs.pacman}/etc/pacman.conf --dbpath ${emptyDb} "$@"
          '';
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              makepkg       # wrapped: --config <patched makepkg.conf>
              pacman        # wrapped: --config <shipped pacman.conf>
              libarchive    # bsdtar: extracts the .deb source and packages
              fakeroot      # root-less packaging
              curl          # source download (DLAGENTS)
              coreutils     # b2sum integrity check
              gnutar xz zstd gzip bzip2
              file gettext gawk gnused gnugrep findutils which
            ];

            shellHook = ''
              echo "makepkg $(${pkgs.pacman}/bin/makepkg --version | head -n1 | cut -d' ' -f3) ready (patched config)"
              echo "Build:  makepkg -f"
              echo "Verify: makepkg --verifysource"
              echo "Regen:  makepkg --printsrcinfo > .SRCINFO"
            '';
          };
        });
    };
}
