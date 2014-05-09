1)	sudo apt-get install git

	2)	git config --global user.name "jagadish"

3)	git config --global user.email "p.jagadish43@gmail.com"

4)	we need to check for existing SSH keys on your computer. Open up your Terminal and type:
	cd ~/.ssh
	ls -al
	# Lists the files in your .ssh directory
	Check the directory listing to see if you have files named either id_rsa.pub or id_dsa.pub. If you don't have either of those files go to step 2. Otherwise, you can skip to step 3.

5)	sudo apt-get install xclip
	# Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)

6)	xclip -sel clip < ~/.ssh/id_rsa.pub
	# Copies the contents of the id_rsa.pub file to your clipboard

7)	you can open the ~/.ssh/id_rsa.pub file and copy the contents of the file manually
	gedit ~/.ssh/id_rsa.pub
	then open ssh key file we can copied the ssh key and paste in to the github

8) 	To make sure everything is working, you'll now try SSHing to GitHub
	ssh -T git@github.com
	# Attempts to ssh to github
	Then the below code is displayed
	# Hi username! You've successfully authenticated, but GitHub does not
	provide shell access.