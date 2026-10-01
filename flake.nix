{

  inputs = {
    miso.url = "github:dmjio/miso";
    # MicroHs (mhs) support lives on miso's microhs branch for now
    miso-mhs.url = "github:dmjio/miso/microhs";
  };

  outputs = inputs:
    inputs.miso.inputs.flake-utils.lib.eachDefaultSystem (system: {
      devShell = inputs.miso.outputs.devShells.${system}.default;
      devShells.hls = inputs.miso.outputs.devShells.${system}.hls;
      devShells.wasm = inputs.miso.outputs.devShells.${system}.wasm;
      devShells.ghcjs = inputs.miso.outputs.devShells.${system}.ghcjs;
      devShells.mhs = inputs.miso-mhs.outputs.devShells.${system}.mhs;
    });

}

