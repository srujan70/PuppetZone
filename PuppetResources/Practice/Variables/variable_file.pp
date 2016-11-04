$owner = 'root'
$group = 'root'
$mode = '0644' 
file { '/temp.txt':
    ensure => file,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
    content=> 'Hi This is from puppet'
}

file { '/mydir':
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
}

notify { 'Hi This is from puppet': } 
