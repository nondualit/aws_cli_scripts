# aws_cli_scripts
Some AWS cli scripts and examples


ec2_aws_firewall.sh sript is an integration of the AWS CLI and bash working together to make my life less misserable.
The purpose of this script is simple: My AWS instances runs behind a ec2 SecurityGroup (AWS Firewall) which is pretty hard to break and give you a good sence of security. I travel a lot and use different public IPs and dont want to add this publics IP using the console all the time. After loging off i delete the entries making my system a little bit more secure.

- Merging add and del firewall script in one script with options to ec2_aws_firewall.sh
- Adding options -a (add) -d (del) -h (help) to ec2_aws_firewall.sh
- Adding port number as a read option as some of you may have ssh on a different port
- Reorganizing the whole script
- Added option -s to show current state
- Deleting the old add and del scripts 
- Help option re-done
- dip (Delete IP from other than your ip

<iframe width="560" height="315" src="https://www.youtube.com/embed/Zrs_4EZ8UHE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
