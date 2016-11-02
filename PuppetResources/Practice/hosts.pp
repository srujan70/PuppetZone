host { 'example.com':
    ensure  => present ,
    ip      => '127.0.0.1' ,
    host_aliases => 'example.com',    
}