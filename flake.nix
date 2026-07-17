{
  description = "Native Arch Linux test runner for the jfsh AUR package";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      testPackage = pkgs.writeShellApplication {
        name = "test-jfsh-aur";
        runtimeInputs = [ pkgs.podman ];
        text = ''
          if [[ ! -f PKGBUILD || ! -f .SRCINFO ]]; then
            echo "Run this command from the jfsh AUR repository root." >&2
            exit 1
          fi

          exec podman run \
            --signature-policy ${pkgs.writeText "policy.json" ''
              {
                "default": [
                  {
                    "type": "insecureAcceptAnything"
                  }
                ]
              }
            ''} \
            --rm \
            --pull=always \
            --mount "type=bind,source=$PWD,target=/pkg,readonly" \
            --mount "type=volume,source=jfsh-aur-pacman-cache,target=/var/cache/pacman/pkg" \
            docker.io/library/archlinux:base-devel \
            bash -euxo pipefail -c '
              useradd --create-home builder
              install -d -o builder -g builder /build
              cp -a /pkg/. /build/
              chown -R builder:builder /build

              source /build/PKGBUILD
              pacman -Syu --noconfirm --needed \
                devtools \
                namcap \
                shellcheck \
                "''${depends[@]}" \
                "''${makedepends[@]}"

              runuser -u builder -- bash -c \
                "cd /build && pkgctl license check"
              runuser -u builder -- bash -c \
                "cd /build && shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164 PKGBUILD"
              diff -u /build/.SRCINFO \
                <(runuser -u builder -- bash -c "cd /build && makepkg --printsrcinfo")

              find /build -maxdepth 1 -type f -name "*.pkg.tar.*" -delete
              export SOURCE_DATE_EPOCH=946684800
              runuser -u builder -- bash -c \
                "cd /build && makepkg --cleanbuild --clean"
              first_packages="$(mktemp -d)"
              cp /build/*.pkg.tar.zst "$first_packages/"
              runuser -u builder -- bash -c \
                "cd /build && makepkg --cleanbuild --clean --force"
              for package in /build/*.pkg.tar.zst; do
                cmp "$package" "$first_packages/$(basename "$package")"
              done

              # namcap cannot resolve cross-package symlinks in split debug packages.
              namcap /build/PKGBUILD /build/"$pkgname"-[0-9]*.pkg.tar.zst \
                | tee /tmp/namcap.log
              if grep -q " E: " /tmp/namcap.log; then
                exit 1
              fi

              pacman -U --noconfirm /build/*.pkg.tar.zst
              expected_version="$(
                runuser -u builder -- bash -c \
                  "cd /build && source PKGBUILD && printf %s \"\$pkgver\""
              )"
              jfsh --version 2>&1 | grep -F "version $expected_version"
            '
        '';
      };
    in
    {
      packages.${system}.test = testPackage;

      apps.${system} = rec {
        default = test;
        test = {
          type = "app";
          program = "${self.packages.${system}.test}/bin/test-jfsh-aur";
          meta.description = "Test the jfsh package in a disposable Arch Linux container";
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.podman
          testPackage
        ];
      };
    };
}
