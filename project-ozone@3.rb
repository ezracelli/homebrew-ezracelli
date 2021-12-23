class ProjectOzoneAT3 < Formula
    desc "Project Ozone 3: A New Way Forward is a pack filled to the brim of mods ranging from tech to magic to even exploration."
    homepage "https://www.curseforge.com/minecraft/modpacks/project-ozone-3-a-new-way-forward"
    sha256 "4a6e4a97305dbc14ebb4062a63737823af8bc9c28b7c85740f538b1c16fb85b6"
    url "https://media.forgecdn.net/files/3496/692/PO3+-+3.4.4server.zip"
    version "3.4.4"

    depends_on "openjdk@8"

    def install
        rm Dir["*.bat"]
        prefix.install Dir["*"]

        forge_version = "2855"
        minecraft_version = "1.12.2"

        (bin/"project-ozone@3").write <<~EOS
            #!/bin/sh
            exec "#{Formula["openjdk@8"].opt_bin}/java" ${JAVA_OPTS:--Xmx6144M -Xms1024M} -jar "#{prefix}/forge-#{minecraft_version}-#{forge_version}.jar" nogui
        EOS
    end

    def caveats
        <<~EOS
            Configuration files are located in
                #{prefix}
        EOS
    end

    service do
        run [opt_bin/"project-ozone@3"]
        working_dir opt_prefix
    end

    test do
        system "true"
    end
end
