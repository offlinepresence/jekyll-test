{ pkgs ? import <nixpkgs> {} }:
let
  stdenv = pkgs.stdenv;
  fetchurl = pkgs.fetchurl;
  ruby = pkgs.ruby;
in rec {

  gems = pkgs.bundlerEnv {
    name = "redcarpet";

    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };

  homepage = stdenv.mkDerivation {
    name = "homepage";
    buildInputs = with pkgs; [git gems];
  };

}