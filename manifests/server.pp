class sauerbraten::server (
   $install_root    = '/usr/local',
   $run_as          = 'sauerbraten',
   $maxclients      = 8,
   $description     = "Company Team Building",
   $motd            = "",
   $ffa_maps        = $sauerbraten::ffa_maps_default,
   $capture_maps    = $sauerbraten::capture_maps_default,
   $ctf_maps        = $sauerbraten::ctf_maps_default,
   $sp_maps         = $sauerbraten::sp_maps_default,
   $hide_sauer_dns  = 'true', # adds "127.0.0.1 sauerbraten.org" to /etc/hosts
   $append_cfg      = ""
)
inherits sauerbraten {

   File {
      ensure => 'file',
      owner  => 'root',
      group  => 'games',
      mode   => '0664'
   }

   file { "$install_root/sauerbraten":
      ensure => 'directory',
      mode   => '0775'
   }

   file { "$install_root/sauerbraten/linux_server":
      mode    => 0755,
      source  => "puppet:///modules/sauerbraten/linux_server.bin",
      require => File["$install_root/sauerbraten"]
   }

   file { "$install_root/sauerbraten/linux_64_server":
      mode    => 0755,
      source  => "puppet:///modules/sauerbraten/linux_64_server.bin",
      require => File["$install_root/sauerbraten"]
   }

   file { "$install_root/sauerbraten/server-init.cfg":
      mode      => 0600,   # has game passwords in it, can't be world-readable
      content   => template("sauerbraten/server-init.cfg.erb"),
      require   => File["$install_root/sauerbraten"]
   }


   if $hide_sauer_dns == 'true' {
      host { "sauerbraten.org":
         ensure  => 'present',
         name    => 'sauerbraten.org',
         ip      => '127.0.0.1',
         comment => 'Prevent sauerbraten server from calling home'
      }
   }


   /*
    * Make it start up automatically as a background service.
    */

   file { "/etc/rc.d/init.d/sauerbraten":
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => 0755,
      content => template("sauerbraten/sauerbraten.erb")
   }
   
   user { "$run_as":
      ensure     => 'present',
      name       => $run_as,
      gid        => 'games',
      password   => '!!',            # placeholder for no password
      managehome => false,           # user Type doesn't create or remove this
      forcelocal => true,            # in case PAM manages accounts in central location
      shell      => '/sbin/nologin'
   }

   file { "/var/log/sauerbraten.log":
      owner  => $run_as, # Create it here so server can write to it
      require => User[$run_as]
   }

   exec { "chkconfig":
      command     => "/sbin/chkconfig sauerbraten on",
      subscribe   => File["/etc/rc.d/init.d/sauerbraten"],
      refreshonly => true
   }

   service { "sauerbraten":
      name       => "sauerbraten",
      hasstatus  => true,
      hasrestart => true,
      subscribe  => [
         File["$install_root/sauerbraten/linux_server"],
         File["$install_root/sauerbraten/linux_64_server"],
         File["$install_root/sauerbraten/server-init.cfg"],
         File["/etc/rc.d/init.d/sauerbraten"],
         Exec["chkconfig"],
         Host["sauerbraten.org"]
      ]
   }
}
