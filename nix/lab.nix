{ pkgs ? import <nixpkgs> {}
, lib
, stdenv
}:
pkgs.buildEnv {
  name = "clab";
  paths = with pkgs; [
    # Programming languages

    clang
    clang-tools
    (hiPrio gcc)  # conflicts with clang (e.g. `c++`)
    perl
    python3
    zig

    # Development tools

    bear
    cmake
    cpm-cmake
    cppcheck
    gdb
    git
    lldb
    gnumake
    ninja
    vcpkg

    # Other tools

    curl
    direnv
    gnupg
    htop
    jq
    mise
    rsync
    unzip
    wget
    zip

    # More

    go-task
    gojq
    jless
    just
    mani
    micromamba
  ]
  ++ lib.optionals stdenv.isLinux [
    strace
    valgrind
  ]
  ;
}