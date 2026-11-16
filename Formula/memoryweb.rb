# typed: false
# frozen_string_literal: true

class Memoryweb < Formula
  desc "Persistent knowledge graph MCP server for AI agents"
  homepage "https://github.com/corbym/memoryweb"
  version "1.67.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_amd64.tar.gz"
      sha256 "8c5253a364d1e9b9cbe8204b407b5f5e924cf604c1e18526368f614d5256a867"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_arm64.tar.gz"
      sha256 "3759d206c728ad958cb705138c2d8a09cb38502988e2005c6fcd709f665d0f57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_amd64.tar.gz"
      sha256 "3abaceb091fad662868e9fea803481042d9311034f2f54141559204a31e73470"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_arm64.tar.gz"
      sha256 "07e5b9af4cace033ec76105f28838a241099cdf17d7b2430e70d80500ec382f8"
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
