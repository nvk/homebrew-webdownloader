# Copyright (c) 2025 nvk
# Licensed under the MIT License

class Webdownloader < Formula
  include Language::Python::Virtualenv

  desc "Command-line tool to download websites for offline use with multiple output options"
  homepage "https://github.com/nvk/webdownloader"
  url "https://github.com/nvk/webdownloader/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0969a8d1a97900ac880f641d39fe79cdf23e3a37db4d0aa7328005b62efdadf8"
  license "MIT"

  depends_on "python"

  def install
    virtualenv_create(libexec, "python3")
    
    # Install required pip packages
    system libexec/"bin/pip", "install", "beautifulsoup4"
    system libexec/"bin/pip", "install", "requests"
    system libexec/"bin/pip", "install", "html2text"
    
    # Install from source directory
    system libexec/"bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all:", "."
    
    bin.install Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"webdownloader", "--help"
  end
end 