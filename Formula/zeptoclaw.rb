class Zeptoclaw < Formula
  desc "Ultra-lightweight AI assistant framework written in Rust"
  homepage "https://github.com/qhkm/zeptoclaw"
  version "0.9.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-aarch64"
      sha256 "d597aa97e843a6698a318faa873bc3a12d91f542574148736910dcc956a185d8"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-x86_64"
      sha256 "427a34bd6b170ad88bdccdea7ed2be99a71255c2420c5d88997144b6ea11102d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-aarch64"
      sha256 "f7e75f589812626048830aa1fe8e71eb757bbc9ae7f51897d2c4a32a7dee4a10"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-x86_64"
      sha256 "70919f3d2162d4a55a705d481c7ea159ab3f6565e9cc0328065a82e8b053321b"
    end
  end

  def install
    bin.install stable.url.split("/").last => "zeptoclaw"
  end

  test do
    assert_match "zeptoclaw", shell_output("#{bin}/zeptoclaw version")
  end
end
