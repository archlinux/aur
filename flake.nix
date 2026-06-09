{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.pacman
	  pkgs.fakeroot


          (pkgs.writeShellApplication {
            name = "gensrcinfo";
            text = ''
              #!/bin/sh
              echo "Generating srcinfo..."
              makepkg --printsrcinfo --config ${pkgs.pacman}/etc/makepkg.conf > .SRCINFO
              echo "Done."
            '';
          })
        ];
      };
    };
}
