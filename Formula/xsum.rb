# typed: false
# frozen_string_literal: true

class Xsum < Formula
  desc "Checksum utility"
  homepage "https://github.com/sclevine/xsum"
  version "0.1.0"
  license "Apache-2.0"
  head "https://github.com/sclevine/xsum.git", tag: "v0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-macos-amd64"
      sha256 "725545d97a1cb3849b0f44b7ddd76015e5cd5d69def363dd574b058b7d0e6fe4"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-macos-arm64"
      sha256 "2e462d575e6211e1e3676bf15df2155e0f0bb7f00d1d4e92ac7b5626f577de75"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-linux-amd64"
      sha256 "08506ccd50411feee4bd6dd64fc77d2357852c2833f15445fb88f4a4448576be"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-linux-arm64"
      sha256 "046c5e1c0f9f4d4784e4f593145c69f3251b0fdafe4d34235b590fa71eb9eeb6"
    end
  end

  def install
    cpu = Hardware::CPU.intel? ? "amd64" : "arm64"
    os = OS.mac? ? "macos" : "linux"
    bin.install "xsum-#{os}-#{cpu}" => "xsum"
  end

  test do
    system "#{bin}/xsum", "-v"
  end
end
