{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {nixpkgs, hyprland, ...}: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
        hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
      ];
    };
  };
}

