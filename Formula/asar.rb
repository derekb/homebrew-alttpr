class Asar < Formula
    desc "(Now) official repository of the SNES assembler Asar, originally created by Alcaro"
    homepage "https://github.com/RPGHacker/asar"
    url "https://github.com/RPGHacker/asar/archive/refs/tags/v1.71.tar.gz"
    sha256 "932e8c4d12d7590e897bc88698d521872f85b8770d713e6351e5a6c8ef8e2896"
    license "LGPL-3.0-or-later"
  
    depends_on "cmake" => :build
  
    def install
      system "cmake", "src"
      system "make"
      mv "asar", "target"
      mv "target/asar-standalone", "asar"
      
      bin.install "asar"
    end
  
    test do
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "#{bin}/asar", "--version"
    end
  end