{
  description = "My system config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    pyprland.url = "github:hyprland-community/pyprland";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    stylix,
    fenix,
    ...
  }: let
    conf = import ./config.nix;
  in {
    packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        {
          nixpkgs.overlays = [fenix.overlays.default];
        }
        ./nixos
        stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.backupFileExtension = "home_manager_backup";

          home-manager.users.${conf.me.username} = import ./home;
        }
      ];
    };
  };
}
