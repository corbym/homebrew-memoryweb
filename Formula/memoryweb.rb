# typed: false
# frozen_string_literal: true

class Memoryweb < Formula
  desc "Persistent knowledge graph MCP server for AI agents"
  homepage "https://github.com/corbym/memoryweb"
  version "1.60.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_amd64.tar.gz"
      sha256 "f5847f3e12b85929a2bb6a078f6f56595b99d9c8eb623faa3a3dd0698d130bc4"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_arm64.tar.gz"
      sha256 "c2d263949332789d05df5b540341d21d1ac91f53c965d68b3d078765ed6b423b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_amd64.tar.gz"
      sha256 "739e2689b2d4e23596f139acfde1cb283a84f319c5e249d63a9a55ef8f1936d2"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_arm64.tar.gz"
      sha256 "b1d94013f0140c30eb27fe4f5ef9bf91406564cf728acf0b97c3c5332dc00905"
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
