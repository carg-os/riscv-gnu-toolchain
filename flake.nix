{
  description = "GNU toolchain of CargOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }@inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    packages."${system}".default = pkgs.stdenv.mkDerivation {
      pname = "riscv-gnu-toolchain";
      version = "2024-04-20";

      src = pkgs.fetchzip {
        url = "https://github.com/carg-os/riscv-gnu-toolchain/releases/download/2024-04-20/riscv-gnu-toolchain.zip";
        hash = "sha256-0d9rlH45+UW0vAEtrvt0eesqD55mNQrXkypX23VByWQ=";
      };

      nativeBuildInputs = [ pkgs.autoPatchelfHook ];

      buildInputs = with pkgs; [
        elfutils
        expat
        flex
        gmp
        guile
        libmpc
        libz
        mpfr
        ncurses
        python311
        xxHash
        isl_0_24
        zstd
      ];

      installPhase = ''
        mkdir -p $out
        cp -r * $out
      '';
    };
  };
}
