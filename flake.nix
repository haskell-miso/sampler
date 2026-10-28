{

  # Miso's cachix cache, so that the dev shells (e.g. haskell-language-server
  # in .#hls) are downloaded prebuilt instead of built from source. A flake's
  # nixConfig only applies to the flake you run, not to its inputs, so this
  # repeats miso's.
  nixConfig = {
    extra-substituters = [
      "https://haskell-miso-cachix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "haskell-miso-cachix.cachix.org-1:m8hN1cvFMJtYib4tj+06xkKt5ABMSGfe8W7s40x1kQ0="
    ];
  };

  inputs = {
    miso.url = "github:dmjio/miso";
  };

  outputs = inputs:
    inputs.miso.inputs.flake-utils.lib.eachDefaultSystem (system: {
      devShell = inputs.miso.outputs.devShells.${system}.default;
      devShells.hls = inputs.miso.outputs.devShells.${system}.hls;
      devShells.wasm = inputs.miso.outputs.devShells.${system}.wasm;
      devShells.ghcjs = inputs.miso.outputs.devShells.${system}.ghcjs;
      devShells.mhs = inputs.miso.outputs.devShells.${system}.mhs;
    });

}

