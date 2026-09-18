{
  chaotic.direnv = {
    homeManager = {
      programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
        enableFishIntegration = true;

        nix-direnv.enable = true;
      };
    };
  };
}
