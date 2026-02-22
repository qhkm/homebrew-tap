class Zeptoclaw < Formula
  desc "Ultra-lightweight AI assistant framework written in Rust"
  homepage "https://github.com/qhkm/zeptoclaw"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-aarch64"
      sha256 "3b3cf353f9817b18f3ebc7a5b5d2bbdbf74310b08edf2dc537ec9dffa2a7cbbf"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-macos-x86_64"
      sha256 "31688a24a35dc35426720468aa1b9dbf59211ce6f639e8d410a562e7bbe1787d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-aarch64"
      sha256 "b8f563818c9617cdc77cc44c2ddf412c165cb8fe42f578e9a3882977fc82aba3"
    else
      url "https://github.com/qhkm/zeptoclaw/releases/download/v#{version}/zeptoclaw-linux-x86_64"
      sha256 "133f4849f7a64250e1abeb84bc61b42a7f5228336a6277185a8f7a577d0ea6aa"
    end
  end

  def install
    bin.install stable.url.split("/").last => "zeptoclaw"
  end

  test do
    assert_match "zeptoclaw", shell_output("#{bin}/zeptoclaw version")
  end
end
