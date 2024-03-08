## 显卡安装

[驱动](https://www.nvidia.cn/Download/index.aspx?lang=cn)
[CUDA](https://developer.nvidia.com/downloads)

##

在 Ubuntu Server 上读取 U 盘（USB 存储设备）的内容并复制粘贴文件主要涉及以下几个步骤：

插入 U 盘：将 U 盘插入服务器的 USB 端口。

查找 U 盘设备：使用 lsblk 命令来查看所有可用的磁盘和分区，以此来识别 U 盘对应的设备文件。通常 U 盘会被系统识别为/dev/sdb1、/dev/sdc1 等（具体设备名称可能不同，取决于其他已连接的设备）。

创建挂载点：在文件系统中创建一个目录，用作 U 盘的挂载点。例如，可以创建一个名为/mnt/usb 的目录。

```sh
sudo mkdir /mnt/usb
```

挂载 U 盘：使用 mount 命令将 U 盘挂载到刚刚创建的目录。假设 U 盘设备是/dev/sdb1，可以使用以下命令：

```sh
sudo mount /dev/sdb2 /mnt/usb
```

访问 U 盘内容：现在 U 盘已经挂载到/mnt/usb 目录，可以通过访问这个目录来读取 U 盘的内容。

```sh
cd /mnt/usb
```

ls
复制文件：使用 cp 命令来复制文件。例如，若想将 U 盘中名为 example.txt 的文件复制到你的主目录，可以使用：

```sh
sudo cp /mnt/usb/example.txt ~/example.txt
```

这会将/mnt/usb/example.txt 文件复制到你的主目录（~代表当前用户的主目录）。

卸载 U 盘：在完成文件操作后，使用 umount 命令安全卸载 U 盘，以避免数据丢失。

```sh
sudo umount /mnt/usb
```

在卸载之后，可以安全地移除 U 盘。

请根据你的具体情况（如设备文件名和所需的目标路径）调整以上命令。注意使用 sudo 时可能需要输入用户密码。在处理文件和文件系统时务必小心，以避免数据丢失或损坏。

在 Ubuntu 中，你可以使用 cp 命令来复制文件夹 A 中的所有内容到文件夹 B。这里有两种常用的方法来完成这个任务：

1. 使用 cp 命令的递归选项
   在终端中，你可以使用 cp 命令配合-r（或-R，两者在 cp 命令中作用相同）选项来递归地复制文件夹及其所有内容。如果文件夹 B 不存在，它将被创建；如果文件夹 B 已经存在，文件夹 A 的内容将被复制到文件夹 B 内。

```sh
cp -r /path/to/folderA/\* /path/to/folderB/
```

在这个命令中，/path/to/folderA/是你想要复制内容的源文件夹的路径，而/path/to/folderB/是目标文件夹的路径。请确保替换成实际的路径。

2. 使用 rsync 命令
   rsync 是一个更为强大的工具，用于同步文件和目录。它不仅可以用于本地复制操作，还可以用于远程文件传输。rsync 在复制文件时更加高效，特别是当目标文件夹中已经有一些文件时，它只会复制那些在源文件夹中有但在目标文件夹中没有的文件，或是在源文件夹中有更新的文件。

```sh
rsync -av /path/to/folderA/ /path/to/folderB/
```

这里的选项意义如下：

-a（或--archive）：这个选项表示递归模式，并保留符号链接、文件权限、文件时间戳、组、所有者信息和设备文件。
-v（或--verbose）：提供详细的输出，展示正在复制的文件。
请注意，rsync 命令在源文件夹路径的末尾包含了斜杠(/)。这指示 rsync 复制文件夹内的内容到目标路径，而不是复制整个文件夹本身作为目标路径中的一个子文件夹。如果你省略了源路径末尾的斜杠，rsync 将会把整个 folderA 复制到 folderB 中，结果是/path/to/folderB/folderA/。

使用以上任一方法，你都可以将文件夹 A 中的所有内容复制到文件夹 B 中。选择哪种方法取决于你的具体需求和偏好。

```sh
lsblk
sudo mount /dev/sdb2 /mnt/usb
ls -all /mnt/usb
rsync -av /mnt/usb/diffusion/models/ /home/dasoncheng/source/space/stable-diffusion-webui/models/
#rsync -av /home/dasoncheng/source/space/stable-diffusion-webui/models/ /mnt/usb/diffusion/models/
sudo umount /mnt/usb
```
