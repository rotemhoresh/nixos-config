{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    gopls
    golangci-lint-langserver
    golangci-lint
    delve
  ];
}
