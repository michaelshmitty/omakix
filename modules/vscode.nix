{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.omakix;
in {
  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = [
        pkgs.vscode-extensions.enkia.tokyo-night
      ];
      userSettings = {
        "editor.fontFamily" = "CaskaydiaMono Nerd Font";
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
        "workbench.colorTheme" = "Tokyo Night";
        "window.titleBarStyle" = "custom";
      };
    };
  };
}
