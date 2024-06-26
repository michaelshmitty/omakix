{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.omakix;
  fontNameMappings = {
    cascadia-mono = "CaskaydiaMono Nerd Font";
    fira-mono = "FiraMono Nerd Font";
    jetbrains-mono = "JetBrainsMono NFM";
    meslo = "MesloLGLDZ Nerd Font";
  };
  fontName = fontNameMappings.${cfg.font};

  vscodeThemeMappings = {
    catppuccin = {
      name = "Catppuccin Macchiato";
      extension = pkgs.vscode-extensions.catppuccin.catppuccin-vsc;
    };
    # FIXME(m): Nixpkgs does not seem to have `vscode-extensions.sainnhe.everforest`
    everforest = {
      name = "Everforest Dark";
      extension = null;
    };
    gruvbox = {
      name = "Gruvbox Dark Medium";
      extension = pkgs.vscode-extensions.jdinhlife.gruvbox;
    };
    # FIXME(m): Nixpkgs does not seem to have `vscode-extensions.qufiwefefwoyn.kanagawa`
    kanagawa = {
      name = "Kanagawa";
      extension = null;
    };
    nord = {
      name = "Nord";
      extension = pkgs.vscode-extensions.arcticicestudio.nord-visual-studio-code;
    };
    rose-pine = {
      name = "Rosé Pine Dawn";
      extension = pkgs.vscode-extensions.mvllow.rose-pine;
    };
    tokyo-night = {
      name = "Tokyo Night";
      extension = pkgs.vscode-extensions.enkia.tokyo-night;
    };
  };
  themeExtension = vscodeThemeMappings.${cfg.theme}.extension;
in {
  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = lib.optionals (themeExtension != null) [themeExtension];
      userSettings = {
        "editor.fontFamily" = fontName;
        "editor.tabSize" = 2;
        "security.workspace.trust.untrustedFiles" = "open";
        "editor.minimap.enabled" = false;
        "git.ignoreMissingGitWarning" = true;
        "editor.fontSize" = 12;
        "editor.occurrencesHighlight" = "off";
        "editor.selectionHighlight" = false;
        "editor.suggestOnTriggerCharacters" = false;
        "editor.tabCompletion" = "on";
        "editor.quickSuggestions" = {
          "other" = false;
          "comments" = false;
          "strings" = false;
        };
        "files.trimTrailingWhitespace" = true;
        "git.confirmSync" = false;
        "window.menuBarVisibility" = "compact";
        "git.autofetch" = true;
        "git.openRepositoryInParentFolders" = "always";
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "workbench.colorTheme" = vscodeThemeMappings.${cfg.theme}.name;
        "window.titleBarStyle" = "custom";
      };
    };
  };
}
