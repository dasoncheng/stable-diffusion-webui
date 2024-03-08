sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.enp3s0.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.wlp2s0.disable_ipv6=1
# torch = {version = "2.0.1", source = "pytorch"}
# torchvision = {version = "0.16.2", source = "pytorch"}