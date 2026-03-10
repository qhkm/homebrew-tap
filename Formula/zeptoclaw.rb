class Zeptoclaw < Formula
  desc "Ultra-lightweight AI assistant framework written in Rust"
  homepage "https://github.com/qhkm/zeptoclaw"
  version "0.7.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-aarch64"
      sha256 "228fe8736cfe5c6de3ebb7a08653431e1708f3942ef7e81116700bf14de52b5b"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-x86_64"
      sha256 "d2ddbac367694c33a4da5fd0a6ebf760ba2a655774488db9aad7140374708348"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-aarch64"
      sha256 "40e44d8f5f9a8acfa2ffd69f657c54bf2d640ae55eb2d5d66bed36031a800b96"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-x86_64"
      sha256 "bb4539d85c85f40c27be3b2be10bef13cbd641d241796960a06f92bde1b3d5ea"
    end
  end

  def install
    bin.install stable.url.split("/").last => "zeptoclaw"
  end

  test do
    assert_match "zeptoclaw", shell_output("#{bin}/zeptoclaw version")
  end
end

