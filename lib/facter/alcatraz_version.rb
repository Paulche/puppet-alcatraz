
Facter.add("alcatraz_version") do
  setcode do
    begin
      File.open('/var/db/.puppet_alcatraz').read.chomp
    rescue Errno::ENOENT 
      'not_installed'
    end
  end
end
