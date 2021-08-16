# stdouterr

## combining stdout and stderr

### what is `stdouterr`?

a cli application that writes to stdout and stderr upon execution

### why is `stdouterr`?

often while testing shell redirections, i am not sure if i am doing it right. 🤦😠
so i made a shell script each time. this is an attempt to not repeat myself, and have
have a readily available tool i can use 🤓✨

### how is `stdouerr`?

🥚 initialised

### how to use ?

not distributing compiled versions yet (it's not even released!)

so you can compile it yourself

#### dependencies
- `stdio.h`
- `stdlib.h`
both of which you most likely got when installing your compiler

if for some reason you don't have it and your compilation fails
#### Debian / Ubuntu / family
install the package named `libc6-dev`
#### RHEL / Fedora / CentOS family
install the package named `glibc-devel`
#### other
sorry no idea. Google will be your friend tho

#### compilation
```shell
gcc -o stdouterr src/main.c
```

#### installation
##### only for current user
```shell
cp ./stdouterr ~/.local/bin/
# OR
cp ./stdouterr ~/bin
```
##### for all users on the system
```
# as root or using sudo
cp ./stdouterr /usr/local/bin
```

### contributing

not licensed yet. but there isn't really a lot of "unique" code to license 🤷
