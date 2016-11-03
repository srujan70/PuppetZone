# This is a simple variable test
$puppetcontent = "This is managed by Puppet"
notify { $puppetcontent: } 
# To use variables along with strings
notify { "Message : $puppetcontent": } 


