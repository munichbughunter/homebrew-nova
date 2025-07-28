class Nova < Formula
  desc "AI-powered CLI for project management and development workflows with MCP integration"
  homepage "https://github.com/munichbughunter/nova"
  version "0.1.0-alpha"
  license "MIT"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/munichbughunter/nova/archive/refs/tags/v0.1.0-alpha.tar.gz"
    sha256 "b1b7ca1eab57bb0f554b2cee9251b079d62f862bb12accba41f4f13fb8f35d44"  # Wird automatisch aktualisiert
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/munichbughunter/nova/releases/download/v#{version}/nova-macos-amd64"
    sha256 "PLACEHOLDER_AMD64_SHA256"  # Wird automatisch aktualisiert
  elsif OS.linux?
    url "https://github.com/munichbughunter/nova/releases/download/v#{version}/nova-linux-amd64"
    sha256 "PLACEHOLDER_LINUX_SHA256"  # Wird automatisch aktualisiert
  end

  def install
    case Hardware::CPU.arch
    when :arm64
      bin.install "nova-darwin-arm64" => "nova"
    when :x86_64
      if OS.mac?
        bin.install "nova-darwin-x64" => "nova"
      else
        bin.install "nova-linux-x64" => "nova"
      end
    end

    # Install shell completions if available
    generate_completions_from_executable(bin/"nova", "completion")
  end

  def caveats
    <<~EOS
      Nova CLI has been installed successfully!

      You can now use the 'nova' command in your terminal.

      To get started, run:
        nova setup
      
      To set up MCP integration in your project:
        nova mcp setup
      
      To start the MCP server:
        nova mcp server
      
      For more information and documentation:
        https://github.com/munichbughunter/nova
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nova --version")
    assert_match "Nova CLI", shell_output("#{bin}/nova --help")
    
    # Test MCP setup functionality
    testpath = Pathname.new(Dir.mktmpdir)
    cd testpath do
      system "#{bin}/nova", "mcp", "setup"
      assert_predicate testpath/".vscode/mcp.json", :exist?
      assert_predicate testpath/".cursor/mcp.json", :exist?
    end
  end
end