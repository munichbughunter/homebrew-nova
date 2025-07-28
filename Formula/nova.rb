class Nova < Formula
  desc "Nova CLI - Intelligent project management and development workflows"
  homepage "https://github.com/munichbughunter/nova"
  version "v0.1.0-alpha"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/munichbughunter/nova/releases/download/v#{version}/nova-macos-arm64"
    sha256 :no_check
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/munichbughunter/nova/releases/download/v#{version}/nova-macos-amd64"
    sha256 :no_check
  elsif OS.linux?
    url "https://github.com/munichbughunter/nova/releases/download/v#{version}/nova-linux-amd64"
    sha256 :no_check
  end

  def install
    bin.install Dir["*"].first => "nova"
  end

  test do
    system "#{bin}/nova", "--version"
  end
end
