# typed: false
# frozen_string_literal: true

class XsumPcm < Formula
  desc "xsum plugin to calculate checksum of raw PCM inside audio files"
  homepage "https://github.com/sclevine/xsum"
  version "0.1.0"
  license "Apache-2.0"
  head "https://github.com/sclevine/xsum.git", tag: "v0.1.0"
  depends_on "xsum"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-pcm-macos-amd64"
      sha256 "692cdcae23d56ea11d3913dcbd6dda036d9db11f56577e7144bbc7aeee5aa497"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-pcm-macos-arm64"
      sha256 "f3a0967ed4406c198dc7fba2bebb2027adaa97801c31d235a2263ccf2743efab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-pcm-linux-amd64"
      sha256 "36cde44182b0a19a50d6f8c98a70ebc0b9b6d3c89f0a53e6c170c631d207d52a"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sclevine/xsum/releases/download/v#{version}/xsum-pcm-linux-arm64"
      sha256 "0a80d61f52dfdbeb27253c2729c35a6f683d366dbedcece76a6c5396c69d1467"
    end
  end

  def install
    cpu = Hardware::CPU.intel? ? "amd64" : "arm64"
    os = OS.mac? ? "macos" : "linux"
    bin.install "xsum-pcm-#{os}-#{cpu}" => "xsum-pcm"
  end
end
