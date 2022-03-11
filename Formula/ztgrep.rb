# typed: false
# frozen_string_literal: true

class Ztgrep < Formula
  desc "Search inside nested archives"
  homepage "https://github.com/sclevine/ztgrep"
  version "0.3.0"
  license "Apache-2.0"
  head "https://github.com/sclevine/ztgrep.git", tag: "v0.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sclevine/ztgrep/releases/download/v#{version}/ztgrep-macos-amd64"
      sha256 "f807fad254042da7e5cde16207f039eeb0b3f36623a83b9f6def6bb393ead0d4"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sclevine/ztgrep/releases/download/v#{version}/ztgrep-macos-arm64"
      sha256 "0be4e485e78f11376e01e9cfc83361005b2f58f18bb547bd910cc28adf48c89c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sclevine/ztgrep/releases/download/v#{version}/ztgrep-linux-amd64"
      sha256 "286490f1f0c4be6651cb72e5ddc21b0ed16105cd5825b47c7aac4ec5fc473bc5"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sclevine/ztgrep/releases/download/v#{version}/ztgrep-linux-arm64"
      sha256 "01c45b3ba53fef5b2e3e6929c0aef47a13b267e3f2abb00d91eca58ab2a01949"
    end
  end

  def install
    cpu = Hardware::CPU.intel? ? "amd64" : "arm64"
    os = OS.mac? ? "macos" : "linux"
    bin.install "ztgrep-#{os}-#{cpu}" => "cosign"
  end

  test do
    system "#{bin}/ztgrep", "-v"
  end
end
