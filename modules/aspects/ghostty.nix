{
  chaotic.ghostty = {
    homeManager =
      { pkgs, ... }:
      let
        common = {
          enable = true;
          enableZshIntegration = true;
          # clearDefaultKeybinds = true;
          settings = {
            keybind = [
              "ctrl+shift+x=toggle_split_zoom"
              "ctrl+page_up=next_tab"
              "ctrl+page_down=previous_tab"
            ];
            theme = "light:Monokai Pro Light,dark:Monokai Pro";
            scrollback-limit = 104857600; # 100 MiB
            # Skip remote terminfo installs; Ghostty's SSH wrapper uses xterm-256color instead.
            shell-integration-features = "cursor,no-sudo,title,ssh-env,path";
            tab-inherit-working-directory = false;
            window-inherit-working-directory = false;
          };
        };
        mac = {
          package = pkgs.ghostty-bin;
          settings = {
            keybind = [
              "cmd+t=new_tab"
              "cmd+s=new_split:down"
              "cmd+shift+s=new_split:right"
              "cmd+alt+up=goto_split:up"
              "cmd+alt+left=goto_split:left"
              "cmd+alt+right=goto_split:right"
              "cmd+alt+down=goto_split:down"
              "global:super+shift+3=toggle_quick_terminal"
              "shift+insert=paste_from_clipboard"
            ];
            copy-on-select = "clipboard";
          };
        };
        linux = {
          package = pkgs.ghostty;
          settings = {
            keybind = [
              "alt+t=new_tab"
              "alt+s=new_split:down"
              "alt+shift+s=new_split:right"
              "alt+up=goto_split:up"
              "alt+left=goto_split:left"
              "alt+right=goto_split:right"
              "alt+down=goto_split:down"
              "shift+insert=paste_from_selection"
            ];
            copy-on-select = true;
          };
        };
        platform = if pkgs.stdenv.hostPlatform.isDarwin then mac else linux;
      in
      {
        programs.ghostty =
          common
          // platform
          // {
            settings =
              common.settings
              // platform.settings
              // {
                keybind = common.settings.keybind ++ platform.settings.keybind;
              };
          };
      };
  };
}
