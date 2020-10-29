{
  description = "Check if some code respects the school's norm";

  outputs = { self, nixpkgs }: let

    norminette = nixpkgs.legacyPackages.x86_64-linux.callPackage ./default.nix { };

  in {
    packages.x86_64-linux.norminette-paris = norminette ./configs/42-paris.conf;
    packages.x86_64-linux.norminette-lyon = norminette ./configs/42-lyon.conf;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.norminette-paris;
  };
}
