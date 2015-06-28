How to Run *Tiny Core Linux* on *VirtualBox*
============================================
**VirtualBox** is a program that simulates computer hardware. Operating system installed on VirtualBox runs in a window, just like a normal program, and has no direct effect on host operating system.

**Tiny Core Linux** is one of the smallest Linux distributions (~9MB). Download ISO image from [**HERE**](http://distro.ibiblio.org/tinycorelinux/6.x/x86/release/Core-current.iso)

Set up VirtualBox
-----------------
1. Download and install [**VirtualBox**](http://download.virtualbox.org/virtualbox/4.3.28/VirtualBox-4.3.28-100309-Win.exe)  
2. Click on '_New_', set name to '_tiny-core_' and click next.
3. Choose enough ram (~800MB).
4. Select '_Create a virutal hard drive now_' > '_VDI_' > '_Dynamically allocated_'
5. Start the created virtual machine by double clicking on it. When prompted with '_Select start-up disk_', click the folder button and select the 'Core-current.iso' file.
(This will start *Tiny Core Linux* from live CD, and will not install it on virtual drive, so all changes will be lost on restart; but you can choose *Save the machine state* instead of *Send the shudown signal* when closing Virtual Machine, and the state of machine will be preserved.)
(To exit from Virtual Machine window press right control.)

Install Basic Packages
----------------------
```bash
$ tce-load -wi git
$ tce-load -wi compiletc
```

If You want a proper Linux distribution instead…
------------------------------------------------
Check out this (**instructions**)[conf-files/debian] on how to install and configure Debian Linux on VirtualBox or on the hardware.

