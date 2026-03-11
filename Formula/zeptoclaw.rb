class Zeptoclaw < Formula
  desc "Ultra-lightweight AI assistant framework written in Rust"
  homepage "https://github.com/qhkm/zeptoclaw"
  version "0.7.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-aarch64"
      sha256 "a72853124a24cce942074e13b48ec40fa71060ce84aca6754f6c0a21151dfa1f"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-x86_64"
      sha256 "b087582a4b1c7b43e8f1f185dd1fa2efe5ec0da05920146a8a6b4e22bba4f19c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-aarch64"
      sha256 "85d83eb55195c0ebe6863ae0947f0c62ccc5db28fd91425c4d6b8c520e4cf6d8"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-x86_64"
      sha256 "4e90d2c99d6819efb1531913a23815bc80453c91423fa9b2b808d979d9167aa7"
    end
  end

  def install
    bin.install stable.url.split("/").last => "zeptoclaw"
  end

  test do
    assert_match "zeptoclaw", shell_output("#{bin}/zeptoclaw version")
  end
end
