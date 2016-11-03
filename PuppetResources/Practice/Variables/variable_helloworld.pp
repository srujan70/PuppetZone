# This is a simple variable test
$puppetcontent = "This is managed by Puppet"
notify { $puppetcontent: } 
# To use variables along with strings
notify { "Message : $puppetcontent": } 

$multiline=@(MY)
#This is managed by puppet
Hi
How
Are 
You
${puppetcontent}
MY


