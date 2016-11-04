$owner = 'root'
$group = 'root'
$mode = '0644' 

$fileContent= " Hi This is managed by Puppet \n The owner is ${owner} \n The root is ${root}"
file { '/temp.txt':
    ensure => file,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
    content=> $fileContent
}

file { '/mydir':
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
}

notify { $fileContent: } 
