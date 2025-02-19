require "language/node"

class Twiliodraft < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/isha689/twilio-cli/releases/download/5.1.10-draft.2/twilio-5.1.10-draft.2.tar.gz"
  version "5.1.10-draft.2"
  sha256 "b3e5476bfee16ee736a1487f5766c36bede597907418d73b4535bba168458d58"
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
