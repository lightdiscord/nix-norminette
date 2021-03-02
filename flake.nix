{
  description = "Check if some code respects the school's norm";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.norminette = nixpkgs.legacyPackages.x86_64-linux.callPackage ./default.nix { };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.norminette;
  };
}
