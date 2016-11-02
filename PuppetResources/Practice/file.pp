file { '/test.txt':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => "Hi How are You",
}
