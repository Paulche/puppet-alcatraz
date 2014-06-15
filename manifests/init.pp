
class alcatraz inherits alcatraz::config {
  case $::alcatraz_version {
    'not_installed':{
      exec { 'alcatraz::install':
        command     => "curl -L ${download_url} | tar xvz -C \"${plugins_dir}\"",
        require     => File[$plugins_dir],
        before      => File[$db_path],
      }
    }
    /^\d+\.\d+\.\d+$/:{
      unless $::alcatraz_version == $alcatraz::config::version {
        # Update previous installation
        file { "${plugins_dir}/Alcatraz.xcplugin":
          ensure  => absent,
          force   => true,
          before => Exec['alcatraz::install'],
        }
        
        exec { 'alcatraz::install':
          command     => "curl -L ${download_url} | tar xvz -C \"${plugins_dir}\"",
          require     => File[$plugins_dir],
          before      => File[$db_path],
        }
      }
    }
    default:{
      fail('Invalid $alcatraz_version')
    }
  }

  file { $plugins_dir:
    ensure => present,
  }

  file { $db_path:
    ensure  => present,
    content => $version,
  }
}
