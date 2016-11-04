
$file_details = {
  'path' =>'/tmp/test.txt',
  'owner' => 'root',
  'mode' => '0644',
  'content' => 'Testing',
}

file { $file_details['path'] :
  ensure => file,
  mode => $file_details['mode'],
  content => $file_details['content']
}
