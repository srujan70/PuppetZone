# Class: 
#
#
class ntp::config {
    # resources

    $ntp_conf = @(END) 
    #Managed by puppet - do not edit
    server in.pool.ntp.org iburst prefer
    driftfile /var/lib/ntp/drift
    END

    case $facts['os']['family'] {
    'RedHat': {
        $ntp_service = 'ntpd'
        $admingroup = 'wheel'
    }
    'Debian': {
        $ntp_service = 'ntp'
        $admingroup = 'sudo'
    }
    default : {
        fail("Your ${facts['os']['family']} is not supported")
    }
    }   

    File {
    owner  => 'root',
    group  => $admingroup,
    mode   => '0664',
    ensure => 'file',
    }

    file { '/etc/ntp.conf':
    content => $ntp_conf,
    notify  => Service['NTP_Service'],
    }
    


}