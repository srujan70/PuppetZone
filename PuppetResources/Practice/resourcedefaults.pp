# These are resource defaults
File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    ensure  => file

}

# rest of all will be picked from defaults
file { '/testme.txt':}
file { '/mydir':
    ensure => directory,
 
}
