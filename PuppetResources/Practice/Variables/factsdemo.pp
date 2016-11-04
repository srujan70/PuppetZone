$display = @("END")

Family: ${facts['os']['Family']}
OS: ${facts['os']['name']}
Release: ${facts['os']['release']['full']}

|END

notify { $display: } 
