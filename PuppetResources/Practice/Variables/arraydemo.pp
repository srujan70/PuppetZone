$lines=["Hello\n","How are you doing\n"]

notify { $lines[0]: }
notify { $lines[1]: }

$fileDetails={
    'path'  => '/tmp/test.txt',
    'owner' => 'root',
    'group' => 'root',
    'mode'  => '0655',
    'content' => $lines

} 

file { $fileDetails['path']:
    ensure  => file,
    owner   => $fileDetails['owner'],
    group   => $fileDetails['group'],
    mode    => $fileDetails['mode'],
    content => $fileDetails['content']
}
