class Nova < Formula
  desc "Nova CLI - Intelligent project management and development workflows"
  homepage "https://github.com/munichbughunter/nova"
  version "v0.1.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/munichbughunter/nova/releases/download/v0.1.0/nova-macos-arm64"
    sha256 "4b1dcf020603bbf176a7ff640b26bddde3bfc666ebc6f8acda2bf1cc62f6b14b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/munichbughunter/nova/releases/download/v0.1.0/nova-macos-amd64"
    sha256 "da14e89cedec9e58cacb3d0811dc0860b95ea3be08362cecc6a1e194015262be"
  elsif OS.linux?
    url "https://github.com/munichbughunter/nova/releases/download/v0.1.0/nova-linux-amd64"
    sha256 "b141dff7530fb477848314bef3aa5f58eab55d866196039447150283f2a73a2f"
  end

  def install
    bin.install Dir["*"].first => "nova"
  end

  test do
    system "#{bin}/nova", "--version"
  end
end
