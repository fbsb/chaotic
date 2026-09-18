{
  chaotic.watch = {
    homeManager = { pkgs, ... }: {

      home.packages = with pkgs; [
        watch
      ];

      home.shellAliases = {
        # making watch a alias alows us to run watch on other aliases
        watch = "watch ";
      };
    };
  };
}
