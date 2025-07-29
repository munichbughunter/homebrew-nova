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
    chmod 0755, bin/"nova"
  end

  def caveats
    <<~EOS
      🎉 Nova CLI has been installed successfully!

      To get started:
      
      1. Run the setup assistant:
         $ nova setup

      2. Try out some commands:
         $ nova --version

         # GitLab Integration
         $ nova gitlab projects      # List GitLab projects
         $ nova gitlab dashboard     # Dashboard for GitLab projects

         # Jira Integration
         $ nova jira issues         # List Jira issues
         $ nova jira search        # Search Jira content

         # Confluence Integration
         $ nova confluence spaces   # List Confluence spaces
         $ nova confluence search   # Search content

         # Monitoring & Operations
         $ nova datadog teams      # List Datadog teams

         # AI-Powered Assistant
         $ nova agent              # AI-powered assistance
         $ nova agent eng review --path "src/agents/engineering/code-review/types.ts"
         $ nova agent eng review-mr --interactive
         
      For more information and complete command list:
         $ nova --help
         $ nova <command> --help

      Documentation: #{homepage}

      To enable shell completions, add to your shell config:
      
      For zsh:
        echo 'eval "$(nova completions zsh)"' >> ~/.zshrc

      For bash:
        echo 'eval "$(nova completions bash)"' >> ~/.bashrc
    EOS
  end

  test do
    system "#{bin}/nova", "--version"
  end
end
