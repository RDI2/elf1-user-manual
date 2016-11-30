# System Access

## Using NetID and Password

Once you get the notice of your account activation, you should be able to login to ELF1 with your
netid and password like this;

```
## Log in to ELF
$ ssh <netid>@elf.rdi2.rutgers.edu

## Log in to Caliburn
$ ssh <netid>@caliburn.rdi2.rutgers.edu
```

## (Optional) Setup SSH Key Authentication

SSH Key Authentication is a more secure and useful approach of remote login than password
authentication. If you haven't had a SSH public/private key pair, here's how to create it
and setup the SSH Key Authentication.

### For Linux and Mac OS X

**Step 1.** Generate the pair at your local machine with this command:

```
local$ ssh-keygen
```
We highly recommend setting up the passphrase and save the passphrase on your KeyChain,
but you can also skip entering the passphrase(Not recommended).

You should have your key pair in `~/.ssh`:

```
local$ ls -la ~/.ssh
```

**Step 2.** Take a look at your public key `~/.ssh/id_rsa.pub`, and copy the content:

```
local$ cat ~/.ssh/id_rsa.pub
```

**Step 3.** Login to ELF1 and create `~/.ssh` directory and make it secure by changing the mode to
700.

```
elf$ mkdir ~/.ssh
elf$ chmod 700 ~/.ssh
```

**Step 4.** Open a new file `~/.ssh/authorized_keys` with the `vim` editor, and enter input mode by
pushing `i` key. Then, paste the public key.

```
elf$ vim ~/.ssh/authorized_keys
```

**Step 5.** Exit the input mode by pushing `ESC` key, and save and exit the editer by `:`,`q`, `w`
and `Enter/Return` key.

**Step 6.** Change the mode of authorized_keys to 600:

```
elf$ chmod 600 ~/.ssh/authorized_keys
```

Now you should be able to ssh to ELF1 by using the ssh key authentication.

### For Windows

Sorry, I don't have a Windows machine to write down the steps, so here's the link about
how to set it up on PuTTY:

- [How To Configure SSH Keys Authentication With PuTTY And Linux Server In 5 Quick Steps](https://www.howtoforge.com/how-to-configure-ssh-keys-authentication-with-putty-and-linux-server-in-5-quick-steps)

Also, there're some nice Unix/Linux-like alternatives to PuTTY.
- [gow](https://github.com/bmatzelle/gow)
- [Cygwin](https://www.cygwin.com/)
