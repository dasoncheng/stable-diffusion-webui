# poetry

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

根据提示（Add `export PATH="/root/.local/bin:$PATH"` to your shell configuration file.）把 bin 目录加入环境变量！

```bash
poetry --version #验证是否安装完成
```

换源

在项目的配置 pyproject.toml 最后面添加要用的源

```toml
[[tool.poetry.source]]
name = "tsinghua"
url = "https://pypi.tuna.tsinghua.edu.cn/simple/"
default = true
```

基本使用：

```bash
poetry new poetry-demo # 创建脚手架 （项目模板）

poetry init # 在当前目录创建一个 pyproject.toml
poetry init --python 3.10.12 # 指定版本
```

环境管理：

```bash
poetry env list 　　　　　　　　　　　　 # 查看环境

poetry run python xxxx.py 　　　　　　 # 直接在当前项目环境中运行

poetry shell                         # 进入当前项目环境 （貌似可以替代 conda 了 哈哈哈
```

配置相关：

```bash
poetry confiig --list 　　　　　　 # 查看当前配置
```

依赖管理：

```bash
poetry add gym 　　　　　　　　　 #安装最新稳定版本的 gym
poetry add gym --dev 　　　　　　 #指定为开发依赖（写到 pyproject.toml 中的[tool.poetry.dev-dependencies]下）
poetry add gym=0.26.2 　　　　　　#指定具体的版本
poetry install 　　　　　　　　　　#安装 pyproject.toml 文件中的全部依赖
poetry install --no-dev 　　　　　　#只安装[tool.poetry.dependencies]下的（一般部署时使用）
```

清理缓存：（删除下列文件夹)

````bash
rm -rf ~/.cache/pypoetry/cache/
rm -rf ~/.cache/pypoetry/artifacts/
```

```bash
poetry env remove python
````
