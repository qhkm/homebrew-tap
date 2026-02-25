class Pandorust < Formula
  desc "A pure-Rust document converter — Markdown to HTML, DOCX"
  homepage "https://github.com/qhkm/pandorust"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/pandorust/releases/download/v#{version}/pandorust-darwin-aarch64.tar.gz"
      sha256 "863a764f084dd2c0923e28d093ba6d0a0c6923b318e24cb0681242b117d03bef"
    else
      url "https://github.com/qhkm/pandorust/releases/download/v#{version}/pandorust-darwin-x86_64.tar.gz"
      sha256 "efba240e5ca47a99bbfd6a72410997a71c079cff8e6ad6970b77191ad1d2c726"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qhkm/pandorust/releases/download/v#{version}/pandorust-linux-aarch64.tar.gz"
      sha256 "044cdfb2bb03d1a53ba668ba91c43425f2dadb76ce27ba690e24589ab00e902e"
    else
      url "https://github.com/qhkm/pandorust/releases/download/v#{version}/pandorust-linux-x86_64.tar.gz"
      sha256 "5861e812638092b53fbe7a26757d858024311f87c85d6d14cbe699feb262dea8"
    end
  end

  def install
    bin.install "pandorust"
  end

  test do
    assert_match "pandorust", shell_output("#{bin}/pandorust --version")
  end
end
