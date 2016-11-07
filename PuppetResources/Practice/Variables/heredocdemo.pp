$filecontent=@(BEGIN)
#This is managed by puppet
  Hi
  How
  Are
  you
BEGIN

file { '/tmp/heredoc1.txt':
  ensure => file,
  mode => '0644',
  content => $filecontent ,
}

$dynfilecontent =@("END")
#This is managed by puppet
FileContet is ${filecontent}
END
