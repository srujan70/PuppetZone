file { '/temp.txt':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    content=> 'Hi This is from puppet'
}

file { '/mydir':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
}