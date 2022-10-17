require "language/node"

class TwiliodraftAT5110Draft1 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/isha689/twilio-cli/releases/download/5.1.10-draft.1/twilio-5.1.10-draft.1.tar.gz"
  version "5.1.10-draft.1"
  sha256 "312344eb8c2e921d6d6a5224daf500e1d15dbe3d100d6188154398008a51f98a"
  depends_on "node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end
