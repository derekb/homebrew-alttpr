# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Z3randomizer < Formula
  desc "Zelda 3 Randomizer Template ASM"
  homepage "https://github.com/KatDevsGames/z3randomizer"
  url "https://github.com/derekb/z3randomizer/archive/refs/tags/v31.0.5-brewtap.tar.gz"
  sha256 "d3dc9bee7e76a0c95ad0ea0f262a03a37b7ee1f00d9e03fe825c88bfbc5d6283"
  license "MIT"

  bottle :unneeded

  depends_on "derekb/alttpr/asar"

  def install
    mv "z3r.sh", "z3r"
    bin.install "LTTP_RND_GeneralBugfixes.asm"
    bin.install "z3r"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test z3randomizer`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    output = shell_output("${bin}/z3r")
    assert_match output, "Usage: z3r input_path output_path"
  end
end
