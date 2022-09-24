{
  description = "A collection of Nix templates";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/22.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in { formatter = pkgs.nixfmt; }) // {
        templates.default = {
          path = ./templates/flake;
          description =
            "nix flake new -t github:counterposition/nix-templates .";
        };
      };
}
