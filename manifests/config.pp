
class alcatraz::config {
  $version = '1.0.6'
  $db_path = '/var/db/.puppet_alcatraz'
  
  $download_url = "https://github.com/supermarin/Alcatraz/releases/download/${version}/Alcatraz.tar.gz"
  $plugins_dir  = "/Users/${::boxen_user}/Library/Application Support/Developer/Shared/Xcode/Plug-ins"
}
