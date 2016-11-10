# Class: ntp
# ===========================
#
# Full description of class ntp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ntp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <shaik.khaja.ibrahim@live.in>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class ntp {
#Manage NTP on CentOS and Ubuntu hosts

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

package { $ntp_service:
  before => File['/etc/ntp.conf'],
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

service {'NTP_Service':
  ensure    => 'running',
  enable    => true,
  name      => $ntp_service,
  subscribe => File['/etc/ntp.conf'],
}


}
