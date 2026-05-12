# typed: false
# frozen_string_literal: true

class Memoryweb < Formula
  desc "Persistent knowledge graph MCP server for AI agents"
  homepage "https://github.com/corbym/memoryweb"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_amd64.tar.gz"
      sha256 "2b73f372ee8b6997f7778c6726b2695ef9c93bdd009c28c780acc7fc53b5e95e"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_arm64.tar.gz"
      sha256 "311518c6826d51598e035c4ba5f1d6df454e2d327e8960e0d932f0bb67e4b99a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_amd64.tar.gz"
      sha256 "62a4bbc9a711c46b18ca357ea57eccac39747c2d6de90914a53a434608663b65"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_arm64.tar.gz"
      sha256 "60d29ecb6c48331f7a7b6da4b1c37bb5436ab3596c2840cd299ddb099ca82a59"
    end
  end

  def install
    bin.install "memoryweb"
    (share/"memoryweb/hooks").install Dir["hooks/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memoryweb --version 2>&1")
  end
end
