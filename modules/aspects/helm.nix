{
  chaotic.helm = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.kubernetes-helm
      ];
    };
  };
}
