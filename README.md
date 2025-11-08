# What the heck is this?

`tunnel-usbmuxd` is a Bash script to create an SSH tunnel forwarding
requests to local [usbmuxd](https://github.com/libimobiledevice/usbmuxd)
socket to a remote host. That is, you launch `usbmuxd` on one host, plug an
Apple mobile device to it with a USB cable, then create a tunnel to the
host from another one so that you can use
[libimobiledevice](https://github.com/libimobiledevice/libimobiledevice)
from a host different from the connected one.

It's been only tested on NetBSD. It should work on any POSIX-compliant
platforms but I don't know. I don't care.


# Okay, but why anyone would want to do that?

Because we currently cannot use `usbmuxd` on NetBSD [due to these technical
difficulties](https://github.com/NetBSD/pkgsrc-wip/blob/07e2ae21c7495e500d99e4c90de3db8cba281b18/usbmuxd/TODO). The
only way to use `libimobiledevice` on NetBSD is to forward requests to
either a Linux machine running open-source `usbmuxd` or a macOS machine
with the native one.


# How do I use this sh\*t?

1. Install [OpenSSH](https://www.openssh.org/) if your machine somehow
   doesn't have it.
2. Install [Bash](https://www.gnu.org/software/bash/) if it's not already
   installed.
3. Make sure you can invoke [sudo](https://www.sudo.ws/). This is necessary
   if your `/var/run` isn't world-writable. It most likely isn't. If it is
   your system has a pretty big problem.
4. Install [socat](http://www.dest-unreach.org/socat/) and put it in your
   `PATH`.
5. Clone the repository and copy `tunnel-usbmuxd` somewhere in your `PATH`.
6. Run `tunnel-usbmuxd HOST` to establish a tunnel to the `HOST`. Run it as
   a regular user, not a root.

Now a UNIX domain socket is created at `/var/run/usbmuxd`, which forwards
anything to the same socket on the remote host. Try running `idevice_id` to
see if it works.

You can take down the tunnel by running `tunnel-usbmuxd -k`. You can also
check if it's running by `tunnel-usbmuxd -s`.


# Who made this sh\*t?

PHO made it and licensed it under [the Unlicense](https://unlicense.org/).
