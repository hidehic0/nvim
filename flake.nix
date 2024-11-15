{
  description = "Neovim configuration using Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    # Neovimのプラグインと開発環境の設定
    devShell = pkgs.mkShell {
      buildInputs = [
        pkgs.neovim
        pkgs.vimPlugins.vim-airline
        pkgs.vimPlugins.vim-fugitive
        pkgs.vimPlugins.nvim-treesitter
        # 他のプラグインをここに追加
      ];
    };

    # `defaultPackage` を提供するように設定
    packages.x86_64-linux = {
      default = self.devShell;
    };
  };
}
