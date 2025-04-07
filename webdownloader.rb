# Copyright (c) 2025 nvk
# Licensed under the MIT License

class Webdownloader < Formula
  include Language::Python::Virtualenv

  desc "Command-line tool to download websites for offline use with multiple output options"
  homepage "https://github.com/nvk/webdownloader"
  url "https://github.com/nvk/webdownloader/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0969a8d1a97900ac880f641d39fe79cdf23e3a37db4d0aa7328005b62efdadf8"
  license "MIT"

  depends_on "python@3.9"

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/af/0b/44c39cf3b18a9280950ad63a579ce395dda4c32193ee9da7ff0aed547094/beautifulsoup4-4.12.2.tar.gz"
    sha256 "492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da"
  end

  resource "html2text" do
    url "https://files.pythonhosted.org/packages/0d/c9/20ccd54d52c843a82616b3f44beef5c501ef35412b0ad240e6623bc84eff/html2text-2024.2.26.tar.gz"
    sha256 "a9a7731eeead6d4ee9d4b6d8cfba2b0f3fb3212a6f4880c323e2671e9d26484b"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf/requests-2.28.2.tar.gz"
    sha256 "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf"
  end

  # Include only the essential dependencies
  # Requests has its own dependencies (certifi, charset-normalizer, idna, urllib3)
  # BeautifulSoup4 depends on soupsieve

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"webdownloader", "--help"
  end
end 